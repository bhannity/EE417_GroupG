# EE417_GroupG
EE417 Group G Group Project

The EE417 Group G Web Applications Development Project is a Library Website

***********************************
**Features of the Library Website**
***********************************
 - User login
 - Sign in for new users
 - Separate interface for general users and admin 
 - Browse catalogue for checking the availability of books
 - Borrow/return a book and it reflects in your account page
 - Book a room in library and it adds the booking info in your account page
 - User can change his password from his account page
 - Admin can see the list if registered users in the admin page
 - Admin can add a new admin from admin page as well as he can see the list of admins

*****************************
**Installation Instructions**
*****************************
The decision was made to host the Library website up on the Amazon AWS Service. As follows are the installation instructions on how this was completed.

1. Create an Amazon AWS account.

2. Setup the EC2 service. The EC2 service is used to create a remote linux virtual machine.

   a. An EC2 instance was created and launched. Connect to the EC2 instance using an SSH client from the local desktop.           Command is as follows:
      ssh -i 
      "aws_key_pair_east.pem"ubuntu@ec2-3-250-47-104.eu-west-1.compute.amazonaws.com’

   b. Install Java to the remote linux virtual machine
   
   c. Install Tomcat to the remote linux virtual machine using sudo sudo super user.

   d. After Tomcat was installed, the server started using a shell script found in the directory /opt/apache/tomcat-             9.0.62/bin/startup.sh.
   
   e. The Apache tomcat server was then accessed at the webpage (3.250.47.104.8080) where the Tomcat manager was utilised         to deploy the library website .war file.

3. Setup the RDS service. The RDS service is used in the creation of the remote database.

   a. Setup and launch and RDS instance, MySQL was installed and set up in the database instance.

   b. Within MySQL Workbench, tenter the database server’s login details, in this case they were: 
      hostname - ee417-db.cvmof7us33ml.eu-west-1.rds.amazonaws.com
      port - 3306
      username - admin
      password - ee417groupg 

   c. .SQL file was deployed to MySQL Workbench.

4. Create a rule to authorise all inbounding and outbounding traffic over iPv4, iPv6 and SSH for the Linux instances. This    can be configured in the EC2 Security Groups.

5. Create a script that allows tomcat to start automatically when the EC2 Instance was launched.

6. Server can now be reached at “3.250.47.104.8080/EE417_Group_G”
   a. 3.250.47.104 is the public ip address for the EC2 instance.
   b. 8080 is the port for tomcat
   c. Group_G is the name of the WAR file.
   
***********************
**Video Demonstration**
***********************

Video demo for website can be found here: https://drive.google.com/file/d/1zqtlNYmXVslszZczWRcPSsJ7Uhac_w6y/view?usp=sharing


   

