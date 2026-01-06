data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_launch_template" "web" {
  name_prefix   = "web-lt-ubuntu-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ec2.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              systemctl enable apache2
              systemctl start apache2
              echo "Hello from Ubuntu Auto Scaling Group" > /var/www/html/index.html
              EOF
  )

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "web" {
  min_size         = 2
  desired_capacity = 2
  max_size         = 4

  vpc_zone_identifier = aws_subnet.private[*].id
  target_group_arns   = [aws_lb_target_group.this.arn]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "ubuntu-private-asg"
    propagate_at_launch = true
  }
}
