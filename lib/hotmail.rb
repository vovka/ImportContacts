module ImportContacts
  class Hotmail < ImportContacts::Base
    require 'oauth'
    
    CONTACTS_FEED_URL = 'http://apis.live.net/V4.0/cid-CID/Contacts/AllContacts'
    
    class << self
      def get options={}
        #@consumer = OAuth::Consumer.new(
        #  "", 
        #  "FDxVSucsozP2Qh5Xw5NwTcXfuXkfHdjt", 
        #  :site => "http://login.live.com/wlogin.srf?appid=0000000044039125&alg=wsignin1.0"
        #)
        #@request_token = @consumer.get_request_token
        client.request_headers = {
          'Authorization' => "DelegatedToken dt=\"VsyAulR0cZahZk6dlXYoGhxmxxlTJflABUBe4oSlqfwKA91dVveheC0iA9xqPxo%2F%2FFLBC86btsV6WO4fi1RmW%2FDXRtvokJUAt%2FWWbQz60iXaEwx8g33tpUWesATQ2uvNMLUrS1WsrhBgh2oWcauGB8PcJR5AUHXWhogwZ3T3YKsi97Wyegn8zZafUtDbS%2BawOK50Fs%2B2klhkM%2Bn%2BIX6O9A%3D%3D\"" 
        }
        #client.get contacts_feed_url
        lid = 'cb0d7829daaf415d67a5197224d0f866'
        client.get "https://livecontacts.services.live.com/users/@L@#{lid}/rest/livecontacts"
      end
    end
  end  
end

