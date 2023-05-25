

output "ami" {
value = data.aws_ami.centos.image_id
}

variable "instance_type" {
 default = "t3.small"
}



resource "aws_instance" "instance" {
 ami                    = data.aws_ami.centos.image_id
 instance_type          = var.instance_type
 vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
 tags = {
     Name = var.component_name
   }
 }

  resource "null_resource" "provisioner" {
     depends_on = [aws_instance.instance, aws_route53_record.records]
     provisioner "remote-exec" {
          connection {
           type = "ssh"
           user = "centos"
           password = "DevOps321"
           host = aws_instance.instance.private_ip
          }

         inline = [
            "rm -rf roboshop-shell",
            "git clone https://github.com/Naman-star/roboshop-shell",
            "cd roboshop-shell",
            "sudo bash ${var.component_name}.sh ${var.password}"
         ]

     }
  }




 resource "aws_route53_record" "records" {
   zone_id = "Z08621443HT6YNQD1Z6GT"
   name    = "${var.component_name}-dev.ndevopsb72.online"
   type    = "A"
   ttl     = 30
   records = [aws_instance.instance.private_ip]
 }