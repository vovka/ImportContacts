module ImportContacts
  class Base
    class << self
      private
      
        def client
          @client ||= Mechanize.new
        end
    end
  end
end

