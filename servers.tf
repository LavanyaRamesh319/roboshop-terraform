data "aws_ami" "centos" {
    owners       =["973714476881"]
    most_recent = true
    name_regex  = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow-all" {
      name = "allow-all"
}

variable "components"{
    default = {
        frontend = {
            Name = "frontend"
            instance_type = "t3.small"
        }
        mongodb = {
                    Name = "mongodb"
                    instance_type = "t3.small"
        }
        catalogue = {
                    Name = "catalogue"
                    instance_type = "t3.small"
        }
        redis = {
                    Name = "redis"
                    instance_type = "t3.small"
        }
        user = {
                    Name = "user"
                    instance_type = "t3.small"
        }
        cart = {
                    Name = "cart"
                    instance_type = "t3.small"
        }
        shipping = {
                    Name = "shipping"
                    instance_type = "t3.medium"
        }
        mysql = {
                    Name = "mysql"
                    instance_type = "t3.small"
        }
        rabbitmq = {
                    Name = "rabbitmq"
                    instance_type = "t3.small"
        }
        payment = {
                    Name = "payment"
                    instance_type = "t3.small"
        }
    }
}

resource "aws_instance" "instance" {
   for_each = var.components
    ami       = data.aws_ami.centos.image_id
    instance_type = each.value["instance_type"]
    vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

    tags  = {
        Name = each.value["name"]
    }
}

resource "aws_route53_record" "records" {
    for_each = var.components
    zone_id  = "Z03901213Q1RUE72GTM7"
    name = "${each.value["name"]}-dev.devopz1.online"
    type = "A"
    ttl = 30
    records = [aws_instance.instance[each.value["name"]].private_ip]
    }