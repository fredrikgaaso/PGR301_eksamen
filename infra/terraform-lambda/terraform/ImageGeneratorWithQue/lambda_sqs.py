import logging
import json
import random
import os
import base64
import boto3

# Setup logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

bedrock_client = boto3.client("bedrock-runtime", region_name="us-east-1")
s3_client = boto3.client("s3")

model_id = os.getenv("MODEL_ID")
bucket_name = os.getenv("BUCKET_NAME")
candidate_number = os.getenv("CANDIDATE_NUMBER")

def lambda_handler(event, context):
    try:
        logger.info("Received event: %s", json.dumps(event))

        # Parse the incoming body
        if "body" in event:
            body = event["body"]
            if isinstance(body, str):
                body = json.loads(body)  # Convert string to JSON

        # Loop through all SQS records in the event
        for record in body.get("Records", []):
            # Extract the SQS message body
            prompt = record.get("body")
            if not prompt:
                raise ValueError("Missing 'body' in record: %s" % json.dumps(record))

            seed = random.randint(0, 2147483647)
            s3_image_path = f"{candidate_number}/generated_images/titan_{seed}.png"

            # Prepare the request for image generation
            native_request = {
                "taskType": "TEXT_IMAGE",
                "textToImageParams": {"text": prompt},
                "imageGenerationConfig": {
                    "numberOfImages": 1,
                    "quality": "standard",
                    "cfgScale": 8.0,
                    "height": 512,
                    "width": 512,
                    "seed": seed,
                },
            }

            # Invoke the model
            response = bedrock_client.invoke_model(
                modelId=model_id,
                body=json.dumps(native_request)
            )

            model_response = json.loads(response["body"].read())
            base64_image_data = model_response["images"][0]
            image_data = base64.b64decode(base64_image_data)

            # Upload the image to S3
            s3_client.put_object(Bucket=bucket_name, Key=s3_image_path, Body=image_data)

        return {
            "statusCode": 200,
            "body": json.dumps("Success")
        }

    except Exception as e:
        logger.error(f"Error occurred: {str(e)}")
        return {
            "statusCode": 500,
            "body": json.dumps(f"Internal server error: {str(e)}")
        }
