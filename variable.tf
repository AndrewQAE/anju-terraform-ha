variable "ami" {
  type        = string
  description = "The AMI ID to use for the EC2 instance"
  default     = "ami-0e5df6fd7455a69b3" # Example AMI ID, replace with your desired AMI
}

variable "instance_type" {
  type        = string
  description = "The instance type for the EC2 instance"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for the EC2 instance"
  default     = "anju-demo"
}

variable "environment" {
  type        = string
  description = "The environment for the EC2 instance (e.g., dev, prod)"
  default     = "dev"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the Auto Scaling Group"
  default     = ["subnet-05f806379727510a1", "subnet-006f580470672aa42", "subnet-0cad5914a26b35df6"] # Example subnet IDs, replace with your desired subnets
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID for the load balancer"
  default     = "vpc-0021093bed929b9bd" # Example
}
