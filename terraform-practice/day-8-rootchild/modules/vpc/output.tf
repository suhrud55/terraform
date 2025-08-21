output "subnet_ids" {
  value = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}
output "subnet1_id" {
  value = aws_subnet.subnet1.id
  
}
output "subnet2_id" {
  value = aws_subnet.subnet2.id
  
}