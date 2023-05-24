components = {
frontend = {
      name = "frontend"
      instance_type = "t3.small"
    }
    mongodb = {
          name = "mongodb"
          instance_type = "t3.small"
    }
    catalogue = {
          name = "catalogue"
          instance_type = "t3.micro"
    }
    redis = {
          name = "redis"
          instance_type = "t3.small"
    }
    user = {
          name = "user"
          instance_type = "t3.small"
    }
    cart = {
          name = "cart"
          instance_type = "t3.micro"
    }
    mysql = {
          name = "mysql"
          instance_type = "t3.small"
          password = "RoboShop@1"
    }
    shipping = {
          name = "shipping"
          instance_type = "t3.medium"
    }
    rabbitmq = {
          name = "rabbitmq"
          instance_type = "t3.small"
          password = "Robosop@1"
    }
    payment = {
          name = "payment"
          instance_type = "t3.small"
          password = "roboshop123"
    }
}

env = "dev"