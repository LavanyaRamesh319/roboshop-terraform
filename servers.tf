resource "aws_instance" "frontend" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "frontend"
    }
}

resource "aws_instance" "mongodb" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "mongodb"
    }
}

resource "aws_instance" "catalogue" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "catalogue"
    }
}

resource "aws_instance" "redis" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "redis"
    }
}

resource "aws_instance" "user" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "user"
    }
}

resource "aws_instance" "cart" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "cart"
    }
}

resource "aws_instance" "mysql" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "mysql"
    }
}

resource "aws_instance" "shipping" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "shipping"
    }
}

resource "aws_instance" "rabbitmq" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "rabbitmq"
    }
}

resource "aws_instance" "payment" {
    ami       = "ami-0f3c7d07486cad139"
    instance_type = "t3.micro"

    tags  = {
        name = "payment"
    }
}