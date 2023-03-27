# infra
Contains the terraform scripts for your project

# Set Up
Add the access key and secret key to the AWS shared credentials file (e.g. ~/.aws/credentials)

# To reconfigure the S3 backend config
To reconfig the project's S3 backend
Note this only keep state doesn't prevent concurrent running, for that dynamodb will be required.
```
terraform init --reconfigure -backend-config="bucket=<S3 Bucket Name>" -backend-config="key=<S3 bucket key name>" -backend-config="region=ap-southeast-1"
```

# Apply Changes
```
terraform apply --var-file=<TFVARS>
```

