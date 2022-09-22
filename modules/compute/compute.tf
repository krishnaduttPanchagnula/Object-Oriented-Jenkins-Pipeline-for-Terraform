##########################
###Lambda,IAM Creation####
##########################

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# resource "aws_lambda_function" "test_lambda" {
#   # If the file is not in the current working directory you will need to include a
#   # path.module in the filename.
#   filename      = "lambda_function_payload.zip"
#   function_name = "lambda_function_name"
#   role          = aws_iam_role.iam_for_lambda.arn
#   handler       = "index.test"

#   # The filebase64sha256() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
#   # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
#   source_code_hash = filebase64sha256("lambda_function_payload.zip")

#   runtime = "python3.9"

#   environment {
#     variables = {
#       foo = "bar"
#     }
#   }
# }

##########################
######EC2 Creation########
##########################


resource "aws_instance" "test_ec2" {
    ami           = "ami-005e54dee72cc1d00" # us-west-2
    instance_type = "t2.micro"
    subnet_id = var.subnet_id  
}