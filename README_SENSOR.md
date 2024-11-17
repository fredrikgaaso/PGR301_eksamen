<strong>Lambda function: <strong/><br/>
https://fm5ds1cg1h.execute-api.eu-west-1.amazonaws.com/Prod/generate-image <br/>
Paste {"prompt": "Prompt for image generator here"}

<strong>Github workflow<strong/><br/>
https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11822299007

<strong>SQS QUE:<strong/><br/>
(Sqs url gotten from aws):
https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75 <br>
(Sqs url gotten from searchbar in browser):
https://eu-west-1.console.aws.amazon.com/sqs/v3/home?region=eu-west-1#/queues/https%3A%2F%2Fsqs.eu-west-1.amazonaws.com%2F244530008913%2Flambda_sqs_queue_75 <br>

<strong>Github workflow main branch:<strong/><br/>
https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11855057052

<strong>Github workflow lambda branch:<strong/><br/>
https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11855105327

<strong>Explanation for Docker tag:<strong/><br/>
I chose to use the date as the tag for the Docker containers because it provides a good overview of when things are pushed. 
At the same time, a "latest" tag is also pushed so that other developers always know which version is the most recent.<br/>

<strong>Docker image and SQS que:<strong/><br/>
fredrikgaaso/imagegenerator-75 
https://sqs.eu-west-1.amazonaws.com/244530008913/terraform-75-SimpleQueue-ITrY5qV4c0gZ <br/>

<strong>Github workflow Docker push:<strong/><br/>
https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11857542929
