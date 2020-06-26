# cloudformation101

Introduction to AWS CloudFormation & CodePipeline

Things To Consider

Consider goals. What are they?
To automate launching (2) EC2 instances and (1) RDS database to host St Lukes Health. The RDS database will first be provisioned and output the credentials. 

Then the EC2 instances will be (autoscaled, optional) created, with an AMI (created beforehand) in (2) different availability zones (CF mappings). We do not expect the EC2 instances to fail but in the event that they do, we can have a separate CF template to launch just (1) EC2 instance and connect to the database. 

All EC2 instances that are launched must attach to an Application Load Balancer's Target Group (specific to that hostname [i. e. chistlukeshealth.org or chistjoseph.org]. The process of attaching the EC2 instance to the target group can be done in AWS CLI which can then be scripted and added in the User Data portion of the EC2 instance creation (User Data launches/runs a bash script upon creation). 

Prior to attaching to target group, another script must be ran to configure AWS CLI programmatic access (sudo apt install awscli -y;aws configure set aws_access_key <accesskey>;aws configure set aws_secret_access_key secretkey;aws configure set default.region us-east-1;). 

2. Consider current infrastructure. What is it?
VPC environment already set up, Subnets already set up, Security Groups already set up, Application Load Balancer already set up.

3. How will we create the template?
Template #1 
Create RDS database, output db credentials
Create (2) EC2 instances via AMI, output ec2 instance id, grab db credentials and use grep, sed, awk to take credentials into settings.php file (drupals config file).

4. Are there any parts that need to be scripted?
yes, pasting the credentials will have to be scripted
mounting the efs drive
running unison to sync local to efs
running build processes (gulp build, npm run build)
attaching to target group (alb)

5. Are there any parts of AWS that require CLI (programmatic access)?
yes, attaching to target group (alb)

6. What are the dynamic variables that are required to automate the stack?
db credentials, ec2 instance id

7. What parts require maintenance after the stack is launched?
making sure the instances are healthy (will set up logging / cloudwatch as next steps)
