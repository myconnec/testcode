# Build AWS EC2 AMI for ConnecHub

## Usage

When code is changed, trigger a new build of the EC2 instance based off a `golden image` we build manually.

Once the new AMI is available, check that we only store only 5.

Use terraform to update the Auto-Scale Group.

And finally rotate the instances.
