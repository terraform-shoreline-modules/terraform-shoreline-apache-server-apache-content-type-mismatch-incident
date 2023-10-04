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