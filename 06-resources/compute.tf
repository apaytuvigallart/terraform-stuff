resource "aws_instance" "nginx-test-instance" {
  ami                         = "ami-09e7de9baf4ee57f2"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_http_https.id]
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }
  tags = merge(local.common_tags, {
    Name = "06-resources-nginx-test-instance"
  })
  lifecycle {
    create_before_destroy = true
  }
}