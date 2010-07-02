require File.join(File.dirname(__FILE__), '../import_contacts')
require File.join(File.dirname(__FILE__), 'helpers.rb')
require 'yaml'

user_info = YAML::load(
  load_config(
    File.join(File.dirname(__FILE__), '../config/user.info')  ) )[:hotmail]

contacts = ImportContacts::Hotmail.get user_info
save_to_file 'hotmail_contacts.out', contacts.body#.inspect

