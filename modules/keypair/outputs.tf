output "key_name" {
  value = aws_key_pair.ec2_user_keypair.key_name
}

output "private_key_path" {
  value = local_file.private_key_pem.filename
}

output "private_key_pem" {
  value     = tls_private_key.generated.private_key_pem
  sensitive = true
}