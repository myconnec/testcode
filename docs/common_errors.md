# Common Errors

E) 'Instance profile already exists': https://github.com/hashicorp/terraform/issues/3749

```sh
aws iam delete-instance-profile --instance-profile-name profile_name_here
```


E) Error creating IAM policy connechub_lambda_logging_www: EntityAlreadyExists: A policy called connechub_lambda_logging_www already exists. Duplicate names are not allowed.

```sh
aws iam delete-policy connechub_lambda_logging_www
```

E) Connection #0 to host media-source-84353407-c9be-f0a5-44c8-651f7942c60f-dev.s3.us-west-1.amazonaws.com left intact
... HTTP response code 403 was returned, returning EPERM': Updated the user access policy to allow access to the new buckets.
