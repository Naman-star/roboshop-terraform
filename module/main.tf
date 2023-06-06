

output "ami" {
value = data.aws_ami.centos.image_id
}





resource "aws_instance" "instance" {
 ami                    = data.aws_ami.centos.image_id
 instance_type          = var.instance_type
 vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
 tags = {
     Name = local.name
     //here in 16th row  we used variable local.name u can check inside locals.tf we used condition  that conditions means if var.env is not equal toempty it takes ${var.component_name}-${var.env} this conditions if its empty it takes var.component_name.
     //earlier in 16th row it was component.name
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

          inline = var.app_type == "db" ? local.db_commands : local.app_commands

     }
  }




 resource "aws_route53_record" "records" {
   zone_id = "Z08621443HT6YNQD1Z6GT"
   name    = "${var.component_name}-dev.ndevopsb72.online"
   type    = "A"
   ttl     = 30
   records = [aws_instance.instance.private_ip]
 }