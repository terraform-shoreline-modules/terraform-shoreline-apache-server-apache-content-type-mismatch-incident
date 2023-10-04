
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Apache Content-Type Mismatch Incident
---

The Apache Content-Type Mismatch incident is a type of issue that occurs when there is a conflict between the Content-Type header specified in the HTTP request and the one that is expected by the server. This can lead to problems with processing the request and returning a valid response to the client. This type of incident can affect the performance and functionality of the web application, and may require immediate attention from software engineers to resolve the issue.

### Parameters
```shell

export PORT_NUMBER="PLACEHOLDER"

export CORRECT_CONTENT_TYPE="PLACEHOLDER"

export PATH_TO_APACHE_CONF_FILE="PLACEHOLDER"
```

## Debug

### Check Apache configuration file syntax
```shell
apachectl configtest
```

### Check Apache error log for any errors related to content-type mismatch
```shell
tail -f /var/log/httpd/error_log | grep 'content-type'
```

### Check version of Apache installed
```shell
httpd -v
```

### Check Apache access log for any requests with content-type mismatch
```shell
tail -f /var/log/httpd/access_log | grep 'content-type'
```

### Check Apache virtual hosts configuration
```shell
apachectl -S
```

### Check Apache worker status
```shell
apachectl status
```

### Check if Apache is listening on the correct port
```shell
netstat -tuln | grep ${PORT_NUMBER}
```

### Check Apache process memory usage
```shell
ps aux | grep httpd
```

### Check system memory usage
```shell
free -m
```

## Repair

### Set the correct Content-Type header in the Apache server configuration file.
```shell
bash

#!/bin/bash



# Define variables

APACHE_CONF_FILE=${PATH_TO_APACHE_CONF_FILE}

CONTENT_TYPE=${CORRECT_CONTENT_TYPE}



# Backup the original Apache configuration file

cp $APACHE_CONF_FILE $APACHE_CONF_FILE.bak



# Replace the Content-Type header with the correct value

sed -i "s/Content-Type .*/Content-Type: $CONTENT_TYPE/g" $APACHE_CONF_FILE



# Reload the Apache server to apply the changes

systemctl reload apache2


```