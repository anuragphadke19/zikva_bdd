require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'testuser@zikva.com'
  u.password 'please'
end