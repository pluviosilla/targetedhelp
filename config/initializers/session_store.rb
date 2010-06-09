# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_targetedhelp_session',
  :secret      => 'e087c470651835c48d16ee1c83ab57c36fa51e0cde57c72af0d1e19e7a6bb5b103325a066e7c7be2de08d7d0d624583da8c0019fbf17613dc2312428867cc96b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
