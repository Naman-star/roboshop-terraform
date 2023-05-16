data "aws_ami" "centos" {
  owners            = ["973714476881"]
  most_recent       = true
  name_regex        = "Centos-8-DevOps-practice"
}


output "ami" {
value = data.aws_ami.centos.image_id
}

variable "instance_type" {
 default = "t3.micro"
}

resource "aws_instance" "frontend" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = var.instance_type

  tags = {
    Name = "frontend"
  }
}


resource "aws_route53_record" "frontend" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "frontend-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

output "frontend" {
   value=aws_instance.frontend.public_ip
}

resource "aws_instance" "mongodb" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "mongodb-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "catalogue-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "redis-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "user-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "cart-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "mysql-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "shipping"
  }
}

resource "aws_instance" "rabbitmq" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "rabbitmq-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z08621443HT6YNQD1Z6GT"
  name    = "payment-dev.ndevopsb72.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}

