# resource "aws_ebs_volume" "ebs" {
#     count= 2
#   availability_zone = var.availability_zone[count.index]
#   size              = 1
#   type              = "gp2"

#   tags = {
#     Name = "ebs-volume-${count.index}"
#   }
# }

# resource "aws_volume_attachment" "attachment" {
#     count= 2
#   device_name = "/dev/sdf"
#   volume_id   = aws_ebs_volume.ebs[count.index].id
#   instance_id = aws_autoscaling_group.autoscaling_group.id
# }