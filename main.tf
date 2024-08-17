provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "muguntha" {
    ami           = data.aws_ami.ami_value.id
    instance_type = var.aws_instance_type[count.index] 
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids =[aws_security_group.all.id]
    key_name = "ssg_key"

  tags = {
      Name = var.instance_name[count.index]
  }
    count = 3
   
     
   /* provisioner "local-exec" {
      command = "echo ${aws_instance.muguntha.public_ip} > details.txt"
     
      
    }
    
    connection {
        type = "ssh"
        host = self.public_ip
        user = "ubuntu"
        private_key = file("C:/Users/itssgc/Downloads/ssg_key.pem")
      
    } */


}

