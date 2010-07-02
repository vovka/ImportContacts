require File.join(File.dirname(__FILE__), '../import_contacts')
#require 'shoulda'
require File.join(File.dirname(__FILE__), 'helpers.rb')
require 'yaml'

user_info = YAML::load(
  load_config(
    File.join(File.dirname(__FILE__), '../config/user.info')  ) )[:gmail]

contacts = ImportContacts::Gmail.get user_info
#contacts.class.should == Array
save_to_file 'gmail_contacts.out', contacts.body

