resource "aws_launch_template" "alt" {
  name_prefix   = "alt"
  image_id      = "?????"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 3
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.alt.id
    version = "$Latest"
  }
}
