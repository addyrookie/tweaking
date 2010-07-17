# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tweaking_session',
  :secret      => 'cc494ea8c53c7378894996185d2b1b3edbf0a7b886e6225bd19622bb6055c330f0c47e2fcb1927b6ac26ab718a5edc35540a4109fa79e279da289c8768cd1f4b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
