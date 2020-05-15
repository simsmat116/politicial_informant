# political_informant
A conversational assistant for all of your election needs

## Virtual env ##
python3 -m venv env

## npm ## 
npm install
install modules needed from errors (add flask/requests to req.txt?)

## run locally ##
python run.py to run locally

## reset database ##
cd template/bin/ && ./politicalinformantdb.sh reset && cd ../..

## credentials for arjun's AWS ##
__user:__ arjunsr@umich.edu __pass:__ ArjunEshani$ha
## instructions: ##
ssh -i <name_of_key>.pem ubuntu@<Public DNS (IPv4)> to get onto the aws server

## aws link ##
ec2-3-15-8-136.us-east-2.compute.amazonaws.com

## aws instructions ##
For anyone unfamiliar with AWS:
- go to aws.amazon.com
- log in using these credentials
- click on services -> EC2
- click on the button that says instances, and it will open the dashboard with the aws instances i have. from there, find the one for political informant, and u can right click and either start or stop the instance
