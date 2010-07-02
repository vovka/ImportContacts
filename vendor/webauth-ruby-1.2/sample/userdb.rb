require 'sdbm'

#######################################################################
# This is a user "DB" for demo purposes only.  We strongly recommend
# that a more robust mechanism be used for real application use.
#######################################################################

class UserDB
  def initialize(dbfile)
    @dbfile = dbfile
  end

  def [](id)
    return unless id
    begin
      SDBM.open(@dbfile, 0666) { |userdb|
        return userdb[id]
      }
    rescue Exception => e
      warn("Error: Web Auth sample: Problem while reading the profile database: #{e}")
    end
  end

  def []=(id, name)
    return unless id
    begin
      SDBM.open(@dbfile, 0666) { |userdb|
        userdb[id] = name
      }
    rescue Exception => e
      warn("Error: Web Auth sample: Problem while writing to the profile database: #{e}")
    end
  end
end
