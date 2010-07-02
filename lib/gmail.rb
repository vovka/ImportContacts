module ImportContacts
  class Gmail < ImportContacts::Base
    AUTH_URL = 'https://www.google.com/accounts/ClientLogin'
    DISTINGUISH_AUTH_TOKEN_REGEXP = /\nAuth=(.*)\n/
    APP_NAME_FOR_AUTH_REQUEST = 'Home-RubyContactsImporter-1'
    CONTACTS_FEED_URL = 'http://www.google.com/m8/feeds/contacts/:email/thin'
    #CONTACTS_FEED_URL = 'http://www.google.com/m8/feeds/contacts/default/full'
  
    class << self
      def get options={}
        authorize options
        get_contacts
      end
      
      private
      
        def standardize_email_parameter options
          standardize_parameter 'Email', options, [:username, :user_name, :login]
        end
        
        def standardize_password_parameter options
          standardize_parameter 'Passwd', options, [:password, :pswd, :pwd, :pass]
        end
        
        def standardize_parameter standart_name, options, aliases=[]
          aliases.each do |parameter_alias|
            if options.include? parameter_alias
              options[standart_name] = options[parameter_alias]
              options.delete parameter_alias
            end
          end
          options
        end
        
        def authorize options
          default_post_data = {
            'accountType' => 'GOOGLE', 
            'service' => 'cp', 
            'source' => APP_NAME_FOR_AUTH_REQUEST
          }        
          
          options = standardize_email_parameter options
          options = standardize_password_parameter options
          
          @@email = options['Email']
          
          mechanize_file = client.post AUTH_URL, options.merge(default_post_data)
          
          @@auth_token = mechanize_file.body.match(DISTINGUISH_AUTH_TOKEN_REGEXP)[1]
        end
        
        def get_contacts
          client.request_headers = {
            'Authorization' => "GoogleLogin auth=\"#{@@auth_token}\"" }
          client.get contacts_feed_url
        end
        
        def contacts_feed_url
          CONTACTS_FEED_URL.gsub ':email', @@email if @@email and @@email.is_a? String
        end
    end
  end
end
