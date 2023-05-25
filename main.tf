resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = "billing_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  metric_name               = "EstimatedCharges"
  namespace                 = "AWS/Billing"
  period                    = 43200 #Check every 12 hours
  statistic                 = "Maximum"
  threshold                 = 5
  alarm_description         = "Check if billing goes over $5 for the month"
  insufficient_data_actions = []

  dimensions = {
    Currency = "USD"
  }
}

resource "aws_sns_topic" "billing_alert_topic" {
  name              = "billing_alert_topic"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic_subscription" "billing_alert_subscription" {
  topic_arn = aws_sns_topic.billing_alert_topic.arn
  protocol  = "email"
  endpoint  = "samuel.patrick.mcmanus@gmail.com"
}