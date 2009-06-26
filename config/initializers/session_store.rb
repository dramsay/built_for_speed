# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_built_for_speed_session',
  :secret      => 'd65da6b12d0c155dd1babdada502f46e99aad86fbe033577480981d026136bcdaac40525d526e9deaa0c98c59c5dd0753eff8d39218298eea82a5f92f76b9b3d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
