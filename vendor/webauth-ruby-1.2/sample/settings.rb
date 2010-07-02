require 'cgi'

#######################################################################
# Enables debugging.  View errors in the web server logs.
#######################################################################
DEBUG = true

#######################################################################
# Application key file, should be stored in an area that cannot be
# accessed by the Web.
#######################################################################
KEYFILE = '../Application-Key.xml'

#######################################################################
# Name of the writable SDBM file to use to store the User ID to Name 
# table.  Be aware that for the purposes of the sample, the default 
# value points to a temporary directory that is publically writable by 
# default on many installations.  This directory may be cleaned at any 
# time by system processes or an administrator.
#######################################################################
USERDB = '/var/tmp/webauth-ruby-sample-userdb'

#######################################################################
# Name of cookie to use to cache the user token.  If a persistent
# cookie is being used, COOKIETTL determines its expiry time.
#######################################################################
COOKIE = 'webauthtoken'
COOKIETTL = Time.now + (10 * 365 * 24 * 60 * 60)

#######################################################################
# URL of Web Auth sample index page
#######################################################################
INDEX = 'index.cgi'

#######################################################################
# Landing pages to use after processing login and logout respectively.
#######################################################################
LOGIN = INDEX
LOGOUT = INDEX

#######################################################################
# The location of the Web Auth control.  You should not have to change
# this.
#######################################################################
CONTROLURL = 'http://login.live.com/controls/WebAuth.htm'

#######################################################################
# The CSS style string to pass in to the Web Auth control.
#######################################################################
CONTROLSTYLE = CGI.escape 'font-size: 10pt; font-family: verdana; background: white;'

#######################################################################
# The CSS style to use for the page body.
#######################################################################
BODYSTYLE = %{
    <style type="text/css">
      table
      {
        font-family: verdana;
        font-size: 10pt;
        color: black;
        background-color: white;
      }
      h1
      {
        font-family: verdana;
        font-size: 10pt;
        font-weight: bold;
        color: #0070C0;
      }
    </style>
}
