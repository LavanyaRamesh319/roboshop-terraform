env = "dev"
bastion_cidr = ["172.31.31.227/32"]
default_vpc_id = "vpc-079e0c9e4bd1da0cb"
default_vpc_cidr = "172.31.0.0/16"
default_vpc_rtid = "rtb-028b59719dd99d45a"
kms_arn = "arn:aws:kms:us-east-1:211125447574:key/bc770a11-96d3-4f3a-8ce2-2856e8e6c0ca"
vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    subnets = {
      public = {
        name = "public"
        cidr_block = ["10.0.0.0/24", "10.0.1.0/24" ]
        azs = ["us-east-1a","us-east-1b"]
      }
      web = {
        name = "web"
        cidr_block = ["10.0.2.0/24", "10.0.3.0/24" ]
        azs = ["us-east-1a","us-east-1b"]
      }
      app = {
        name = "app"
        cidr_block = ["10.0.4.0/24", "10.0.5.0/24" ]
        azs = ["us-east-1a","us-east-1b"]
      }
      db = {
        name = "db"
        cidr_block = ["10.0.6.0/24", "10.0.7.0/24" ]
        azs = ["us-east-1a","us-east-1b"]
      }
    }
  }
}

app = {
  frontend = {
    name             = "frontend"
    instance_type    = "t3.small"
    subnet_name      = "web"
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
    allow_app_cidr   = "public"
  }
  catalogue = {
    name             = "catalogue"
    instance_type    = "t3.small"
    subnet_name      = "app"
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
    allow_app_cidr   = "web"
  }
}
#  cart = {
#    name = "cart"
#    instance_type = "t3.small"
#    subnet_name = "app"
#  }
#  user = {
#    name = "user"
#    instance_type = "t3.small"
#    subnet_name = "app"
#  }
#  shipping = {
#    name = "shipping"
#    instance_type = "t3.small"
#    subnet_name = "app"
#  }
#  payment = {
#    name = "payment"
#    instance_type = "t3.small"
#    subnet_name = "app"
#  }
#}

docdb = {
  main = {
    subnet_name = "db"
    allow_db_cidr = "app"
    engine_version = "4.0.0"
    instance_count = 1
    instance_class = "db.t3.medium"
  }
}

rds = {
  main = {
    subnet_name = "db"
    allow_db_cidr = "app"
    engine_version = "5.7.mysql_aurora.2.11.2"
    instance_count = 1
    instance_class = "db.t3.small"
  }
}

elasticache = {
  main = {
    subnet_name = "db"
    allow_db_cidr = "app"
    engine_version = "6.x"
    replicas_per_node_group = 1
    num_node_groups = 1
    node_type  = "cache.t3.micro"
  }
}

rabbitmq = {
  main = {
    subnet_name = "db"
    allow_db_cidr = "app"
    instance_type  = "t3.small"
  }
}

alb = {
  public = {
    name = "public"
    subnet_name = "public"
    allow_alb_cidr = null
    internal = false
  }
  private = {
    name = "private"
    subnet_name = "app"
    allow_alb_cidr = "web"
    internal = true
  }

}