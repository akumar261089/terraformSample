resource "aws_vpc" "main" {
  cidr_block = "172.20.0.0/16"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "main"
  }
}

##public routes


resource "aws_route_table" "pubroute" {
  vpc_id = "${aws_vpc.main.id}"

  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "main"
  }
}

resource "aws_route_table_association" "publicrtas" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.pubroute.id}"
}

##private Route

resource "aws_route_table" "privateroute" {
  vpc_id = "${aws_vpc.main.id}"

  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.ngw.id}"
  }

  tags {
    Name = "main"
  }
}

resource "aws_route_table_association" "privatertas" {
  subnet_id      = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.privateroute.id}"
}


##Subnet

resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.20.20.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "public"
  }
}


resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "172.20.10.0/24"
  tags {
    Name = "private"
  }
}

##EIP

resource "aws_eip" "NATGW" {
  vpc      = true
}


##NAT Gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.NATGW.id}"
  subnet_id     = "${aws_subnet.public.id}"
}
