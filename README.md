# coroin/aws

A Docker container to run [AWS Command Line Interface](https://aws.amazon.com/cli/) commands.

### Installation

Pull the latest version from the Docker registry:

```
$ docker pull coroin/aws
```

### Build

To build the image from source:

```
$ git clone https://github.com/coroin/aws.git
$ cd aws
$ sudo docker build -t="coroin/aws" .
```

### Usage Examples

Download files from S3:

First `export` your AWS credentials to variables (this can be done in a script or directly in the terminal):

```
$ export AWS_ACCESS_KEY_ID="aws-key-id"
$ export AWS_SECRET_ACCESS_KEY="aws-access-key"
$ export AWS_DEFAULT_REGION="aws-region"
$ export AWS_BUCKET="aws-bucket"
```

Then run the `cp` command to download the file(s) from S3:

```
$ sudo docker run --rm \
    -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
    -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
    -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
    coroin/aws \
    cp s3://${AWS_BUCKET}/ . --recursive
```

Note: the following AWS inline policy will grant read-only download access recursively:

```
{
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:ListObjects"
            ],
            "Resource": [
                "arn:aws:s3:::YOUR-BUCKET-NAME",
                "arn:aws:s3:::YOUR-BUCKET-NAME/*"
            ]
        }
    ]
}
```
