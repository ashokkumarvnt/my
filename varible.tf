variable "aws_instance_id" {
    description = "ami_value"
    
}

variable "aws_instance_type" {
    description = "type"
    type = list(string)
     default = ["t2.micro", "t2.small", "t2.medium"]
    
  
}

variable "instance_name" {
    type = list(string)
    default = [ "dev" , "test", "production" ]
  
}

variable "sg_ports" {
    type = list(number)
    default = [80,8080,443,22]
  
}