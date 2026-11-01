# 4. Create the IAM Role
resource "aws_iam_role" "ec2_s3_role" {
  name               = "ec2-s3-access-role"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}

EOF
}


resource "aws_iam_role_policy" "s3_access_policy" {
  name   = "ec2-s3-bucket-access-policy"
  role   = aws_iam_role.ec2_s3_role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-s3-instance-profile"
  role = aws_iam_role.ec2_s3_role.id
}

