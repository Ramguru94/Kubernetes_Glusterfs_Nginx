#/********************************************************************************
#*       Author       : Ramguru
#*       Parameters   : Nil
#*       Purpose      : Run Certbot with the CloudFlare Authenticator
#*       Version      : V-1.0
#*********************************************************************************

#!/bin/bash
/usr/local/bin/certbot certonly --dns-cloudflare --dns-cloudflare-credentials /root/.secrets/cloudflare.ini -d <domain_name> --preferred-challenges dns-01 --non-interactive --agree-tos -m <email_id>
