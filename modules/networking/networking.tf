resource "aws_vpc" "test1" {}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.test1.id
  
  tags = {
    Name = "Main"
  }
}
