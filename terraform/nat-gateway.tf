resource "aws_eip" "nat" {
  count  = length(aws_subnet.public)
  domain = "vpc"

  tags = {
    Name = "nat-eip-${count.index + 1}"
  }

}
resource "aws_nat_gateway" "main" {
    count = length(aws_subnet.public)
    subnet_id = aws_subnet.public[count.index].id
    allocation_id = aws_eip.nat[count.index].id

    tags = {
      Name="nat-gateway-${count.index + 1}"
    }
  
}