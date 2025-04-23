output "bucket_id" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.my_bucket.id
}

output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.my_bucket.arn
}

output "bucket_region" {
  description = "The region where the bucket is created"
  value       = aws_s3_bucket.my_bucket.region
} 