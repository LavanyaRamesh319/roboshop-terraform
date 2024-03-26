data "aws_ami" "centos" {
    owner       =["973714476881"]
    most_recent = true
    name_regex  = "centos-8-Devops-practice"
}

data "aws_security_group" "allow_all" {
      name = "allow_all"
}

variable "instance_type" {
     default = "t3.small"
}

resource "aws_instance" "frontend" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

    tags  = {
        name = "frontend"
    }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "frontend-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "mongodb"
    }
}
resource "aws_route53_record" "mongodb" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "mongodb-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "catalogue"
    }
}
resource "aws_route53_record" "catalogue" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "catalogue-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.catalogue.private_ip]
}


resource "aws_instance" "redis" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "redis"
    }
}
resource "aws_route53_record" "redis" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "redis-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "user"
    }
}
resource "aws_route53_record" "user" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "user-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "cart"
    }
}
resource "aws_route53_record" "cart" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "cart-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "mysql"
    }
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "mysql-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "shipping"
    }
}
resource "aws_route53_record" "shipping" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "shipping-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "rabbitmq"
    }
}
resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "rabbitmq-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
    ami       = data.aws_ami.centos.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]
    tags  = {
        name = "payment"
    }
}
resource "aws_route53_record" "payment" {
  zone_id = "Z03901213Q1RUE72GTM7"
  name    = "payment-dev.devopz1.online"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.payment.private_ip]
}