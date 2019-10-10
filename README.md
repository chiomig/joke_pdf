# Jets Project

This is the sample AWS Lambda applcation (built using the Ruby on Jets Framework) that accompanies the presentation given at https://slides.com/chiomig/building.

The application will retrieve a random Chuck Norris joke and generate a pdf with the contents.

In order to run the application, make sure you have an AWS account set up, along with an S3 bucket to store the pdf files that get generated.

## Download and Setup

- Clone the repo: git clone https://github.com/chiomig/joke_pdf.git
- Navigate into the app: cd joke_pdf
- Install Gems: bundle install --path=vendor
- Deploy: bundle exec jets deploy

## Sample requests

Once the application is deployed to your AWS account, you can make POST requests with a simple JSON payload in the following form:

```
{ "name": "Your Name Here" }
```
