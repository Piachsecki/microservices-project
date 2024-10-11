resource "aws_subnet" "private_zone1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_1_cidr_block
  availability_zone = local.zone1
  tags = {
    "Name"                                               = "${local.env}-private-${local.zone1}"
    "kubernetes.io/role/internal-elb"                    = "1"
    "kubernetes.io/cluster/${local.env}-${var.eks_name}" = "owned"
  }
}



resource "aws_subnet" "private_zone2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_2_cidr_block
  availability_zone = local.zone2
  tags = {
    "Name"                                               = "${local.env}-private-${local.zone2}"
    "kubernetes.io/role/internal-elb"                    = "1"
    "kubernetes.io/cluster/${local.env}-${var.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr_block
  availability_zone       = local.zone1
  map_public_ip_on_launch = true
  tags = {
    "Name"                                               = "${local.env}-public-${local.zone1}"
    "kubernetes.io/role/elb"                             = "1"
    "kubernetes.io/cluster/${local.env}-${var.eks_name}" = "owned"
  }
}


resource "aws_subnet" "public_zone2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr_block
  availability_zone       = local.zone2
  map_public_ip_on_launch = true
  tags = {
    "Name"                                               = "${local.env}-public-${local.zone2}"
    "kubernetes.io/role/elb"                             = "1"
    "kubernetes.io/cluster/${local.env}-${var.eks_name}" = "owned"
  }
}