
terraform {
  backend "s3" {
    bucket = var.backend_bucket
    key    = "${var.environment}/terraform.tfstate"
    region = var.region
  }
}

provider "aws" {
  region = "us-east-1"
}

module "network" {
  source    = "./modules/network"
  vpc_cidr  = "10.0.0.0/16"
}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs" {
  source         = "./modules/ecs"
  service1_image = module.ecr.service1_repo_url
  service2_image = module.ecr.service2_repo_url
  region         = "us-east-1"
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.network.vpc_id
  public_subnets    = module.network.public_subnets
  security_group_id = module.network.ecs_security_group_id
  internal          = true # set false if you want public
}

module "dns" {
  source  = "./modules/dns"
  domain  = "example.com"
  alb_dns = module.alb.alb_dns
}
