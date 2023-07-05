

output "ami" {
value = data.aws_ami.centos.image_id
}





resource "aws_instance" "instance" {
 ami                    = data.aws_ami.centos.image_id
 instance_type          = var.instance_type
 vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
 tags = {
     Name = local.name
     //here in 16th row  we used variable local.name u can check inside locals.tf we used condition  that conditions means if var.env is not equal toempty it takes ${var.component_name}-${var.env} this conditions if its empty it takes var.component_name.
     //earlier in 16th row it was component.name
   }
 }

  resource "null_resource" "provisioner" {
     depends_on = [aws_instance.instance, aws_route53_record.records]
    triggers = {
      private_ip = aws_instance.instance.private_ip
    }
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

 resource "aws_iam_role" "role" {
   name = "${var.component_name}-${var.env}-role"
   assume_role_policy = jsonencode({
     Version = "2012-10-17"
     Statement = [
       {
         Action = "sts:AssumeRole"
         Effect = "Allow"
         Sid    = ""
         Principal = {
           Service = "ec2.amazonaws.com"
         }
       },
     ]
   })

   tags = {
     tag-key = "${var.component_name}-${var.env}-role"
   }
 }

resource "aws_iam_instance_profile" "instance_profile" {

  name = "${var.component_name}-${var.env}-role"
  role = aws_iam_role.role.name
}


 resource "aws_iam_role_policy" "ssm-ps-policy" {
   name = "${var.component_name}-${var.env}-ssm-ps-policy"
   role = aws_iam_role.role.id

   policy = jsonencode({
     "Version" : "2012-10-17",
     "Statement" : [
   {
     "Sid" : "VisualEditor0",
     "Effect" : "Allow",
     "Action" : [
     "kms:Decrypt",
     "ssm:GetParameterHistory",
     "ssm:GetParametersByPath",
     "ssm:GetParameters",
     "ssm:GetParameter"
   ],
     "Resource" : [
     "arn:aws:ssm:us-east-1:871868163784:parameter/${var.env}.${var.component_name}.*",
     "arn:aws:kms:us-east-1:871868163784:key/8ed6ee73-145a-4993-ba10-87a6c6bd693b"
   ]
   }
   ]

   })

 }
