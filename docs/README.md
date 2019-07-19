# Documentation

## Upload Process

- User populates form fields
- Client form POST to web server, EXCLUDE file field
  - Processing animation displayed
- Web server processes form POST data
  - Web Server generates a target filename UUID.source_ext
  - Web Server returns redirect target
- Web server response to Client
  - response code 200
  - required cost to be Paid
  - target filename provided from server
- If payment required
  - submit payment form to Stripe
  - Recieve response payload
  - Client POST Stipe data to Web Server to store Cx and Listing tokens
- Client requests S3 presign URL
- Client POST file to S3 as UUID.ext
  - Once the file is complete, Transcoder is triggered
- Upload process completes
- Client forwards to Listing w/ place holder image 
