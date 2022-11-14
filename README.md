
![Alt text](./images/cloudfront.png?raw=true "Cloudfront Sign Url")

### Important to do

### Command to generate key pair

ssh-keygen -mPEM -t rsa -b 2048 -C "macan-local" -f macan-local -N

### To format key public PKCS8, terraform accept only this format

ssh-keygen -f macan-local.pub -e -mPKCS8

### Link Important

https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-signed-urls.html


