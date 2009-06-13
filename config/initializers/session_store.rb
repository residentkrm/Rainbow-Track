# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rainbow_track_session',
  :secret      => '6152ad1be1bb3a8ee59ed65f04898b88ddec24a908c6d5218a0d811fd1e9996a7b085506f94156ccb39c025549405da2dd967b365fe5a85eecd81c436bee0f13'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
