resource "aws_lb" "loadbalancer" {
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.public_subnets[0].id, aws_subnet.public_subnets[1].id]


  tags = {
    Environment = "test"
  }
}

resource "aws_autoscaling_group" "autoscaling" {
  name                    = "nti-autoscaling-group"
  desired_capacity        = 2
  min_size                = 2
  max_size                = 4
  vpc_zone_identifier     = [aws_subnet.private_subnets[0].id, aws_subnet.private_subnets[1].id]
  #launch_configuration    = aws_launch_configuration.launch_configuration.name
  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }
  target_group_arns         = [aws_lb_target_group.target_group.arn]

  health_check_type         = "ELB"
  health_check_grace_period = 300


}

resource "aws_launch_template" "template" {
  name   = "nti-launch_template"
  image_id                = var.ec2_ami
  instance_type           = var.ec2_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = var.ec2_key
  user_data               = filebase64("script.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "pri-launch-temp"
    }
  }

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 1
    }
  }

}
