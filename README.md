# aws-localstack-sns-bucket-notification
Localstack sns notification to an external url triggered by bucket object creation

## Dependencies
* [**docker**](https://www.docker.com/)
* [**localstack**](https://github.com/localstack/localstack/)

### links of interest:
* [**awslocal**](https://github.com/localstack/awscli-local)
* [**aws sns**](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)
* [**aws sns cli**](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-sns.html)
* [**aws s3 events notification**](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html#how-to-enable-disable-notification-intro/)
* [**aws s3 cli**](https://docs.aws.amazon.com/cli/latest/reference/s3api/)

# run

```bash
docker-compose up
```

# If you did some change and you wanna see them on the container

```bash
docker-compose up --force-recreate --build
```

# to ping an outer localstack endpoint 
in `init.sh` set `--notification-endpoint` with your target path

# to check localstack aws services
```
http://localhost:8085
```

# to check content of a service

```
http://localhost:4572/test-bucket/
```

