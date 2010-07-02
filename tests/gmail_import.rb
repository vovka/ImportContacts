require File.join(File.dirname(__FILE__), '../import_contacts')
require 'shoulda'
require File.join(File.dirname(__FILE__), 'helpers.rb')
require 'yaml'


file = File.new(File.join(File.dirname(__FILE__), '../config/user.info'), "r")
yaml_user_info = ''
while (line = file.gets)
	yaml_user_info << line
end
file.close

user_info = YAML::load yaml_user_info

contacts = ImportContacts::Gmail.get user_info
#contacts.class.should == Array
save_to_file 'gmail_contacts.info', contacts

