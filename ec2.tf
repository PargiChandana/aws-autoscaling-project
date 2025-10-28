# Launch Template
resource "aws_launch_template" "web_template" {
  name_prefix   = "web-template"
  image_id      = "ami-0f5ee92e2d63afc18" # Ubuntu FREE TIER eligible
  instance_type = "t3.micro"

  network_interfaces {
    security_groups = [aws_security_group.web_sg.id]
  }

  user_data = base64encode(<<EOF
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
echo "<h1>NGINX Terraform ASG</h1>" > /var/www/html/index.html
EOF
)
}


