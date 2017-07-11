# coroin/node

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

```
$ export AWS_ACCESS_KEY_ID="aws-key-id"
$ export AWS_SECRET_ACCESS_KEY="aws-access-key"
$ export AWS_DEFAULT_REGION="aws-region"
$ export AWS_BUCKET="aws-bucket"
$ sudo docker run --rm \
    -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
    -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
    -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
    aws \
    cp s3://${AWS_BUCKET}/ . --recursive
```
