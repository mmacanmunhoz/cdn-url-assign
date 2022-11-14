### IMPORTANT TO DO

### TO GENERATE KEY PAIR

ssh-keygen -mPEM -t rsa -b 2048 -C "macan-local" -f macan-local -N

### TO FORMAT KEY PUBLIC PKCS8, TERRAFORM ACCEPT ONLY THIS FORMAT

ssh-keygen -f macan-local.pub -e -mPKCS8

