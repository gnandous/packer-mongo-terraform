# AMI

This project image install and configure a mongodb server on top of an Amazon Linux 2 AMI.

Prerequisites:
  - Packer must be installed on your laptop, you can get it from [here](https://www.packer.io/)
  - Export your AWS Profile export AWS_PROFILE=your-profile

 Once your json file is ready. You can validate it using the following command:

 ```
 packer validate packer.json
 ```
Expected output is :

 ```
 Template validated successfully.
 ```

Then you can validate and push the AMI with the following command:

```
packer build -var-file=variables.json ./packer.json
```

