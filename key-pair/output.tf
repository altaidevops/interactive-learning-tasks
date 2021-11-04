# output "region" {
#   # value = data.aws_region.current.name
#   # value = aws_key_pair.ilearning-wordpress.arn
#   value = "us-east-2"
# }

output "key_name" {
  value = aws_key_pair.ilearning-wordpress.key_name
}

output "key_id" {
  value = aws_key_pair.ilearning-wordpress.key_pair_id
}

output "key_pair_region" {
  value = "us-east-2"
}