output "vpc_id" {
  value = aws_vpc.main.id
}

output "aws_private_subnet_2_id" {
  value = aws_subnet.private_zone2.id
}

output "aws_private_subnet_1_id" {
  value = aws_subnet.private_zone1.id
}