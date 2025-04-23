# Terraform AWS S3 Bucket

This Terraform project creates a secure S3 bucket in AWS with production-ready configurations. The project implements AWS best practices and security measures out of the box.

## Features

- **Secure by Default**:
  - Server-side encryption (AES-256)
  - Versioning enabled for data protection
  - All public access blocked
  - Proper security configurations

- **Flexible Configuration**:
  - Configurable AWS region
  - Customizable bucket naming
  - Environment-based tagging
  - Project-based organization

## Prerequisites

1. **AWS Account and Credentials**:
   - An active AWS account
   - AWS CLI installed and configured
   - AWS credentials with appropriate permissions to create S3 buckets

2. **Required Software**:
   - Terraform (>= 1.2.0)
   - Git (for version control)

3. **AWS IAM Permissions**:
   The AWS user/role needs the following permissions:
   ```json
   {
       "Version": "2012-10-17",
       "Statement": [
           {
               "Effect": "Allow",
               "Action": [
                   "s3:CreateBucket",
                   "s3:DeleteBucket",
                   "s3:PutBucketVersioning",
                   "s3:GetBucketVersioning",
                   "s3:PutEncryptionConfiguration",
                   "s3:GetEncryptionConfiguration",
                   "s3:PutBucketPublicAccessBlock",
                   "s3:GetBucketPublicAccessBlock",
                   "s3:PutBucketTagging",
                   "s3:GetBucketTagging"
               ],
               "Resource": "*"
           }
       ]
   }
   ```

## Project Structure

```
terraform-s3-project/
├── main.tf                    # Main Terraform configuration
├── variables.tf               # Variable definitions
├── outputs.tf                # Output definitions
├── terraform.tfvars.example  # Example variable values
├── .gitignore               # Git ignore patterns
└── README.md                # Project documentation
```

## Step-by-Step Setup Guide

### 1. Local Setup

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd terraform-s3-project
   ```

2. Configure AWS credentials (if not already done):
   ```bash
   aws configure
   ```
   Enter your:
   - AWS Access Key ID
   - AWS Secret Access Key
   - Default region
   - Output format (json recommended)

3. Create your configuration:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

4. Edit terraform.tfvars with your values:
   ```hcl
   aws_region   = "us-east-1"        # Your preferred AWS region
   bucket_name  = "my-unique-bucket" # Must be globally unique
   environment  = "dev"              # dev, staging, or prod
   project_name = "my-project"       # Your project name
   ```

### 2. Terraform Workflow

1. Initialize Terraform:
   ```bash
   terraform init
   ```
   This will:
   - Download required providers
   - Initialize backend
   - Set up modules

2. Format and validate your code:
   ```bash
   terraform fmt
   terraform validate
   ```

3. Review the execution plan:
   ```bash
   terraform plan
   ```
   Verify that the planned changes match your expectations.

4. Apply the configuration:
   ```bash
   terraform apply
   ```
   Review the plan one final time and type 'yes' to proceed.

### 3. Verification Steps

After applying the configuration:

1. Verify bucket creation:
   ```bash
   aws s3 ls | grep <your-bucket-name>
   ```

2. Check bucket encryption:
   ```bash
   aws s3api get-bucket-encryption --bucket <your-bucket-name>
   ```

3. Verify versioning status:
   ```bash
   aws s3api get-bucket-versioning --bucket <your-bucket-name>
   ```

## Variables Reference

| Variable | Description | Type | Default | Required |
|----------|-------------|------|---------|-----------|
| aws_region | AWS region for bucket creation | string | "us-east-1" | No |
| bucket_name | Globally unique bucket name | string | - | Yes |
| environment | Environment (dev/staging/prod) | string | "dev" | No |
| project_name | Project name for tagging | string | "terraform-s3-project" | No |

## Outputs Reference

| Output | Description |
|--------|-------------|
| bucket_id | The name of the created bucket |
| bucket_arn | The ARN (Amazon Resource Name) of the bucket |
| bucket_region | The AWS region where the bucket is created |

## Security Considerations

1. **Encryption**: 
   - Server-side encryption is enabled by default using AES-256
   - All objects stored in the bucket will be automatically encrypted

2. **Access Control**:
   - Public access is completely blocked
   - ACLs are disabled
   - Bucket policies must be explicitly configured

3. **Versioning**:
   - Enabled by default for data protection
   - Helps prevent accidental deletions
   - Maintains history of object changes

## Cleanup

To remove all created resources:

```bash
terraform destroy
```

**Warning**: This will permanently delete the S3 bucket and all its contents.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository. 
