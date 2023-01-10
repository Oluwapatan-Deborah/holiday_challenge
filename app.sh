#!/usr/bin/bash
sudo apt update
sudo apt install nodejs -y
sudo apt install nginx -y
sudo apt install npm -y
cd /$(whoami)/ || cd /home/$(whoami)
git clone https://github.com/Oluwapatan-Deborah/holiday_challenge.git
ls
cd /$(whoami)/holiday_challenge 
sudo npm install
node app.js
sudo npm install pm2 -g
cd /$(whoami)/app.js 
sudo pm2 start app.js
sudo pm2 startup
sudo nano /etc/nginx/sites-available/default
sudo nginx -t
sudo service nginx restart
