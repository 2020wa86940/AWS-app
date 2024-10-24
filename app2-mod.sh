#!/bin/bash
# Update the package manager
yum update -y
# Install Apache web server
yum install -y httpd
# Start the Apache service
systemctl start httpd
# Enable Apache to start on boot
systemctl enable httpd
# Get the instance's Availability Zone from the metadata
AZ=$(curl -s
http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Create a sample HTML file with AZ info
echo "<html>
<head>
<title>Welcome to My Amazon Ec2</title>
</head>
<body>
<h1>Hello from your EC2 instance!</h1>
<p>Good evening Guys.</p>
<p><strong>Availability Zone:</strong> ${AZ}</p>
</body>
</html>" > /var/www/html/index.html
# Restart the Apache service to load the new webpage
systemctl restart httpd