module "vpc" {
  source                      = "vpc"
  public_subnet_1_cidr_block  = var.public_subnet_1_cidr_block
  public_subnet_2_cidr_block  = var.public_subnet_2_cidr_block
  private_subnet_1_cidr_block = var.private_subnet_1_cidr_block
  private_subnet_2_cidr_block = var.private_subnet_2_cidr_block
  vpc_cidr_block              = var.vpc_cidr_block
  eks_name                    = var.eks_name
  region                      = var.region
}



module "eks" {
  source                  = "eks"
  aws_private_subnet_1_id = module.vpc.aws_private_subnet_1_id
  aws_private_subnet_2_id = module.vpc.aws_private_subnet_2_id
  region                  = var.region
}