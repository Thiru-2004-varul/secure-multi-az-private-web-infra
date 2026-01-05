resource "aws_security_group" "alb" {
    name="alb-sg"
    description = "allow HTTP from the internet"
    vpc_id = aws_vpc.main.id

    ingress{
        from_port = 80
        to_port = 80
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_security_group" "ec2" {
    name="ec2-sg"
    description = "allow HTTP from the alb"
    vpc_id = aws_vpc.main.id

    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ aws_security_group.alb.id ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}