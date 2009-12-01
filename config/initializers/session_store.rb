# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_agility_session',
  :secret      => 'e59cb998eddcd8e05117294501c12453ef266b86151ac7a9ba59274270079d07d130728d2201e35f77231ea449290e7e7a49c378ee9d2dd4295186b4ac7ad68d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
