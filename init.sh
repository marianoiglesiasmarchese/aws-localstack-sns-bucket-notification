#!/bin/bash

#SNS
# create topic 
awslocal sns create-topic --name s3-activity
awslocal sns list-topics
# subscribe to topic and define the notification event. Set the notification recipient. Localstack doens't support `email` protocol
awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:000000000000:s3-activity --protocol http --notification-endpoint http://<LOCAL_MACHINE_NETWORK_IP>:8080/some_endpoint
awslocal sns list-subscriptions
# grant permission for `aws-account-id` to publish on this topic
awslocal sns add-permission --topic-arn arn:aws:sns:us-east-1:000000000000:s3-activity --label Publish-Permission --aws-account-id 000000000000 --action-name Publish

#S3
# create bucket
awslocal s3 mb s3://test-bucket
# set bucket notification configuration, in this case will wire a creation event with a sns topic
awslocal s3api put-bucket-notification-configuration --bucket test-bucket --notification-configuration file://notification.json
# add a new object as part of s3
awslocal s3 cp some_file.csv s3://test-bucket/

