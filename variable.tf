variable "region" {
  default = "us-east-1"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  description = "ubuntu ami"
  default     = "ami-0261755bbcb8c4a84"
}

variable "key_name" {
  default = "xxxxxxxxxxxxx"
}

variable "tags" {
  default = "Terraform-Vault-Vals-Server"
}

variable "secgrname" {
  default = "Terraform-Vault-Vals-Sec-Gr"
}
