module "servers" {
 for_each = var.components
 source         = "./module"
 component_name = each.value["name"]
 env            = var.env
 instance_type  = each.value["instance_type"]
 password       = lookup(each.value, "password", "null")
}

//output "ami" {
//value = data.aws_ami.centos.image_id
//}

//variable "instance_type" {
// default = "t3.small"
//}



//resource "aws_instance" "instance" {
// for_each               = var.components
// ami                    = data.aws_ami.centos.image_id
// instance_type          = each.value["instance_type"]
// vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
// tags = {
//     Name = each.value["name"]
//   }
// }

//  resource "null_resource" "provisioner" {
//     depends_on = [aws_instance.instance, aws_route53_record.records]
//     for_each = var.components
//     provisioner "remote-exec" {
//          connection {
//           type = "ssh"
//           user = "centos"
//           password = "DevOps321"
//           host = aws_instance.instance[each.value["name"]].private_ip
//          }

//         inline = [
//            "rm -rf roboshop-shell",
//            "git clone https://github.com/Naman-star/roboshop-shell",
//            "cd roboshop-shell",
//            "sudo bash ${each.value["name"]}.sh ${lookup(each.value, "password", "null")}"
//         ]

//     }
//  }




// resource "aws_route53_record" "records" {
//   for_each = var.components
//   zone_id = "Z08621443HT6YNQD1Z6GT"
//   name    = "${each.value["name"]}-dev.ndevopsb72.online"
//   type    = "A"
//   ttl     = 30
//   records = [aws_instance.instance[each.value["name"]].private_ip]
// }

//////below code is before applying for each above we applied for each so we minimized code.row 9-62 we applied for each



//resource "aws_instance" "instance" {
//  count         = length(var.components)
//  ami           = data.aws_ami.centos.image_id
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = var.components[count.index]
//  }
//}

//row 20-35 we applied count refer learn-terraform>03-loop>count>main.tf




//resource "aws_route53_record" "frontend" {
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "frontend-dev.ndevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.frontend.private_ip]
//


//output "frontend" {
//   value=aws_instance.frontend.public_ip
//

//resource "aws_instance" "mongodb" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "mongodb"
//  }
//

//resource "aws_route53_record" "mongodb" {
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "mongodb-dev.ndevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.mongodb.private_ip]
//

//resource "aws_instance" "catalogue" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "catalogue"
//  }
//

//resource "aws_route53_record" "catalogue" {
//   for_each = var.components
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "${each.value["name"]}"-dev.ndevopsb72.online
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.instance[each.value["name"]].private_ip]
//}


//resource "aws_instance" "redis" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "redis"
//  }
//

//resource "aws_route53_record" "redis" {
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "redis-dev.ndevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.redis.private_ip]
//

//resource "aws_instance" "user" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "user"
//  }
//

//resource "aws_route53_record" "user" {
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "user-dev.ndevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.user.private_ip]
//

//resource "aws_instance" "cart" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "cart"
//  }
//

//resource "aws_route53_record" "cart" {
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "cart-dev.ndevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.cart.private_ip]
//

//resource "aws_instance" "mysql" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "mysql"
//  }
//

//resource "aws_route53_record" "mysql" {
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "mysql-dev.ndevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.mysql.private_ip]
//

//resource "aws_instance" "shipping" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "shipping"
//  }
//

//resource "aws_instance" "rabbitmq" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "rabbitmq"
//  }
//

//resource "aws_route53_record" "rabbitmq" {
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "rabbitmq-dev.ndevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.rabbitmq.private_ip]
//

//resource "aws_instance" "payment" {
//  ami           = "ami-0b5a2b5b8f2be4ec2"
//  instance_type = var.instance_type
//  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

//  tags = {
//    Name = "payment"
//  }
//

//resource "aws_route53_record" "payment" {
//  zone_id = "Z08621443HT6YNQD1Z6GT"
//  name    = "payment-dev.ndevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [aws_instance.payment.private_ip]
//

