require "bundler/setup"
require "jets"
require 'json'

if ENV['USE_REMOTE_PATHS'] == "true"
  require '/var/task/app/models/pdf_handler.rb'
end

Jets.once  # runs once in lambda execution context

def jokes_pdf_handler(event:, context:)
  name = event["name"]
  pdf_handler = PdfHandler.new(name)

  begin
    pdf_response = pdf_handler.build_pdf
    pdf_response
  rescue StandardError => e
    { errors: e.to_s }
  end

end
