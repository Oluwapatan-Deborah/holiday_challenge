# holiday_challenge
**app.sh**
Bash script used to deploy my nodejs app
Runs as User data, too

**app.js,package.json**
Deployed application

**AWS INFRASTRUCTURE**

**VPC**
Created a VPC(holidaychallenge-vpc) and choose vpc and more to automatically launch private subnets,public subnets,routing tables and subnet association, Internet gateways,elastic ip,ip CIDR block,availability zones and network access translator

**EC2**
Created 2 private ec2Instances (nginx-webserver),a key pair login,disabled auto-assigned public IP and created a security group

**Bastion host**
Created a public ec2 instance within the same vpc as the private and enabled auto-assigned public IP


**Deploy Nodejs App**
Connect to Bastion host,to connect to private instance, copy, create and run the app.sh script with ./app.sh or run manually in the private instances

**Setup Load Balancer**
Create Application Load Balancer
Internet facing
Create Security Group for Load Balancer (LB)
Set inbound rules to allow HTTP and HTTPS (from anywhere)
Create HTTP:80 listener

**Create Target Group**
Register private instance in Target Group
Map Load Balancer with public subnet (Internet gateway attached) in VPC

**Security Groups**
Set LB's Security Group to only accept HTTP and HTTPS, from anywhere
Set instance Security Group to allow SSH
Set instance Security Group to only accept HTTP and HTTPS traffic from LB's Security Group

**AMI**
Created an AMI of the running private instance and used it to create a Launch Template for the Auto Scaling Group
Entered image name and description and created AMI
Launch Templates
Create Launch Template
For Application and OS images
Instance type t2.micro
Specify Subnets when creating the Auto Scaling Group
Auto Scaling Groups
Create Auto Scaling Group
Selected created Launch Template
Selected VPC,Subnets and Availability zones
Attached it to my Load Balancer
Selected the Target Group
Set Minumun, Desired and Maximum Capacity
Set scaling policies (optional)
Create Auto Scaling Group
Attached already created private instance to Auto Scaling Group
