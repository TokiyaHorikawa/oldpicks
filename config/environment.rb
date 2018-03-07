# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Rails.application.secrets.aws_access_key_id
Rails.application.secrets.aws_secret_access_key
