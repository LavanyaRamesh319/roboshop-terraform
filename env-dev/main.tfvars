app_servers = {
        frontend = {
            name = "frontend"
            instance_type = "t3.medium"
        }

        catalogue = {
                    name = "catalogue"
                    instance_type = "t3.medium"
        }

        user = {
                    name = "user"
                    instance_type = "t3.medium"
        }
        cart = {
                    name = "cart"
                    instance_type = "t3.medium"
        }
        shipping = {
                    name = "shipping"
                    instance_type = "t3.medium"
                    password = "RoboShop@1"
        }

        payment = {
                    name = "payment"
                    instance_type = "t3.medium"
                    password = "roboshop123"

        }
    }

env =  "dev"

database_servers = {
  redis = {
     name = "redis"
     instance_type = "t3.small"
  }
  mysql = {
     name = "mysql"
     instance_type = "t3.small"
     password = "RoboShop@1"
  }
  mongodb = {
      name = "mongodb"
      instance_type = "t3.small"
  }
  rabbitmq = {
      name = "rabbitmq"
      instance_type = "t3.small"
      password = "roboshop123"
  }
}