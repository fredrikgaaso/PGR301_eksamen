variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "S3 bucket to store Lambda code"
  type        = string
  default     = "pgr301-couch-explorers"
}

variable "candidate_number" {
  description = "Candidate number for Lambda environment"
  type        = string
  default     = "75"
}

variable "alarm_email" {
  description = "Email to be sent to"
  type        = string
  default     = "fredrikravndalgaaso@gmail.com"
}

variable "sqs_queue_name" {
  description = "Name of sqs que"
  type        = string
  default     = "lambda_sqs_queue_75"
}
