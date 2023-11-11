# computer-craft-dev-env
Code on windows and upload to computer craft
# Install and requirements
Python 3.11.0<br>
Use this command to install required packages:<br>
pip install -r requirements.txt
# How to use (windows side)
```
python .\app.py -h
usage: app.py [-h] port server_url

Server that expose script for computer craft

positional arguments:
  port        Server port
  server_url  Server URL

options:
  -h, --help  show this help message and exit
```
app.py create a web server, server_url is the URL or IP to access to this server from outsite.<br>
If you can't open port, you can use ngrok https://ngrok.com/ <br>
Once you server is open, you can write your computer craft scripts in scripts folder.
# How to use (minecraft side)
Open a computer or turtle <br>
Type: wget <YOUR_PUBLIC_SERVER_URL> install <br>
YOUR_PUBLIC_SERVER_URL is your app server url, not minecraft server. If you use ngrok, then it's your ngrok url.<br>
It will download an install script. <br>
Type: install <FOLDER_WHERE_INSTALL_SCRIPTS> <br>
Once it's done, go in <FOLDER_WHERE_INSTALL_SCRIPTS>. <br>
You can see all your scripts and an additional "update" script. Run it for pull change made on windows.  <br>
