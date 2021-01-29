The hardware setup is very basic, I used pin 4 for the power supply,
pin 14 for ground, and pin 12 (GPIO 18) for output. 
For the scripts to run on boot, you need to add the line
"sudo python /home.pi/covid.py &" in the file "/etc/rc.local" 
and create the directory "/home/pi/.config/autostart" 
where you will add the file "covid.desktop".

video link: https://youtu.be/ATBq59ZaFcU
