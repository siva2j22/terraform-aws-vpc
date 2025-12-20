data "aws_availability_zones" "available" {
  state = "available"
}

# then we will get this VPC-ID
#We can access this vpc_id by data.aws_vpc.default.id then we will get vpc_id
data "aws_vpc" "default" {
  default = "true"
}

data "aws_route_table" "main" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name = "association.main"
    values = ["true"]
  }
}

