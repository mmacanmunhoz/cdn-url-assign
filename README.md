
![Alt text](./images/cloudfront.png?raw=true "Cloudfront Sign Url")

### IMPORTANT TO DO

### TO GENERATE KEY PAIR

ssh-keygen -mPEM -t rsa -b 2048 -C "macan-local" -f macan-local -N

### TO FORMAT KEY PUBLIC PKCS8, TERRAFORM ACCEPT ONLY THIS FORMAT

ssh-keygen -f macan-local.pub -e -mPKCS8

### LINK IMPORTANT

https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-signed-urls.html


