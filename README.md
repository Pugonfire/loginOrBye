# loginOrBye
Shuts down Linux system if there are none of the specified users are logged in (physically or via ssh) after a certain time from start up

### Background
- SSH Server PC automatically starts upon power recovery or AC power supplied
- To save power, I ensure that it power offs if I am not logged in physically or via SSH after 3 minutes
- If I ever need to use it again, I can power it on using Wake on LAN via WAN, and log in within 3 minutes
- From a security standpoint, I would think it makes it more secure as the system will shutdown in 3 minutes if:
  - I am not logged in
  - If there's an unathorised user

### System Requirements
- Tested with **UBUNTU LTS 20.04**
- Should be able to work with other distros *but please let me know if it does not*

### Dependencies
- Cron

### Setting up Cron
*If you have cron installed already, you may skip this section)*

1. Check if **cron** is already installed. If it is, skip this section
``` bash
dpkg -l cron 
```

2. Update and upgrade system
``` bash
sudo apt-get update && sudo apt-get upgrade
```

3. Install **cron**
``` bash
sudo apt-get install cron
```

4. Check if Cron is running
``` bash
systemctl status cron
```

5. Create a directory where you can store your executable files (cronjobs). In my case, I will make it in ```/etc/cronjob```
``` bash
sudo mkdir /etc/cronjob
```

### Mounting the script
1. Download/copy ```loginOrBye.sh``` and move it to ```/etc/cronjob``` or the designated directory for your cronjobs

2. Edit ```loginOrBye.sh``` to change the time and the users you want to allow in (i.e. does not shut down if they are logged in)

3. Open crontab
``` bash
sudo crontab -e
```

4. Append the following line in ```crontab```. *Remember to change the path directory if it is not the same as mine.*
``` bash
@reboot /etc/cronjob/loginOrBye.sh
```
Save the file and exit.

### Parting Words
- Do let me know if you find a more efficient or a different solution
- Feel free to add onto the code
