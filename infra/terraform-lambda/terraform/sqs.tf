resource "aws_sqs_queue" "sqs_queue" {
  name                       = "${var.sqs_queue_name}"
  visibility_timeout_seconds = 55
  message_retention_seconds  = 1209600
  delay_seconds              = 10
  max_message_size           = 262144

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

resource "aws_cloudwatch_metric_alarm" "sqs_oldest_message_age" {
  alarm_name          = "${var.sqs_queue_name}-ApproximateAgeOfOldestMessage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = 60
  statistic           = "Maximum"
  threshold           = 1
  alarm_description   = "Alarm triggers if ApproximateAgeOfOldestMessage goes over threshold"
  dimensions = {
    QueueName = aws_sqs_queue.sqs_queue.name
  }

  alarm_actions = [aws_sns_topic.sqs_alarm_topic.arn]
}

resource "aws_sns_topic" "sqs_alarm_topic" {
  name = "${var.sqs_queue_name}-alarm-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.sqs_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}