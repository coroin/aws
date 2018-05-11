# coroin/aws

A minimal install to run [aws-cli](https://aws.amazon.com/cli/) commands.

### Installation

Pull the latest version from the Docker registry:

```
docker pull coroin/aws
```

### Build

To build the image from source:

```bash
git clone https://github.com/coroin/aws.git
cd aws
docker build -t coroin/aws .
```
### Export credentials

Export your AWS credentials to variables (this can be done in a script or directly in the terminal):

```bash
export AWS_ACCESS_KEY_ID="aws-key-id"
export AWS_SECRET_ACCESS_KEY="aws-access-key"
export AWS_DEFAULT_REGION="aws-region"
export AWS_BUCKET="aws-bucket"
```

### Usage Examples

##### List bucket contents:

```bash
docker run --rm \
    -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
    -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
    -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
    coroin/aws \
    s3 ls s3://${AWS_BUCKET}
```

##### Download files:

```bash
docker run --rm \
    -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
    -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
    -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
    coroin/aws \
    s3 cp s3://${AWS_BUCKET}/ . --recursive
```

### AWS IAM Policy Example

The following AWS inline policy will grant read-only download access recursively:

```json
{
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::YOUR-BUCKET-NAME",
                "arn:aws:s3:::YOUR-BUCKET-NAME/*"
            ]
        }
    ]
}
```
