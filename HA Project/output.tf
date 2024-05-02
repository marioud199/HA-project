output "elb_dns_name" {
  value = aws_lb.loadbalancer.dns_name
}

resource "local_file" "dns"{
    filename ="./dns.txt"
    content = " The ELB dns : ${aws_lb.loadbalancer.dns_name}"
}

# # Install the CloudWatch Agent
# curl https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm -O
# sudo rpm -U ./amazon-cloudwatch-agent.rpm

# # Configure the CloudWatch Agent
# cat <<EOF > /tmp/cloudwatch-config.json
# {
#     "agent": {
#         "metrics_collection_interval": 60,
#         "run_as_user": "root"
#     },
#     "metrics": {
#         "append_dimensions": {
#             "InstanceId": "\$(curl -s http://169.254.169.254/latest/meta-data/instance-id)"
#         },
#         "metrics_collected": {
#             "mem": {
#                 "measurement": [
#                     "mem_used_percent"
#                 ]
#             },
#             "swap": {
#                 "measurement": [
#                     "swap_used_percent"
#                 ]
#             }
#         }
#     }
# }
# EOF

# /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/tmp/cloudwatch-config.json

# # Start the CloudWatch Agent
# sudo systemctl start amazon-cloudwatch-agent
# sudo systemctl enable amazon-cloudwatch-agent


