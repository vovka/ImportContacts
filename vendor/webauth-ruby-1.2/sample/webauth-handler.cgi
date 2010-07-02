#!/usr/bin/ruby -I../lib

#######################################################################
# This page handles the login, logout and clearcookie Web Auth
# actions.  When you create a Windows Live application, you must
# specify the URL of this handler page.
#######################################################################

#######################################################################
# Load common settings.  For more information, settings.rb for details.
#######################################################################
require 'settings' 

require 'cgi'
require 'windowslivelogin'

#######################################################################
# Initialize the WindowsLiveLogin module.
#######################################################################
wll = WindowsLiveLogin.initFromXml(KEYFILE)
wll.setDebug(DEBUG)

#######################################################################
# Extract the 'action' parameter from the request, if any.
#######################################################################
cgi = CGI.new
action = cgi.params['action'][0]

#######################################################################
# If action is 'logout', clear the login cookie and redirect to the
# logout page.
#
# If action is 'clearcookie', clear the login cookie and return a GIF
# as response to signify success.
#
# By default, try to process a login. If login was successful, cache
# the user token in a cookie and redirect to the site's main page.  If
# login failed, clear the cookie and redirect to the main page.
#######################################################################
case action
when 'logout'
  cookie = CGI::Cookie.new(COOKIE, '')
  cgi.out('cookie' => [cookie], 'status' => 'REDIRECT', 'location' => LOGOUT){ 
    ''
  }
when 'clearcookie'
  cookie = CGI::Cookie.new(COOKIE, '')
  type, response = wll.getClearCookieResponse()
  cgi.out('cookie' => [cookie], 'type' => type){ response }
else
  user = wll.processLogin(cgi.params)

  if user
    token = user.token
    cookie = CGI::Cookie.new(COOKIE, token)
    cookie.expires = COOKIETTL if user.usePersistentCookie?
    cgi.out('cookie' => [cookie], 'status' => 'REDIRECT', 'location' => LOGIN){ '' }
  else
    cookie = CGI::Cookie.new(COOKIE, '')
    cgi.out('cookie' => [cookie], 'status' => 'REDIRECT', 'location' => LOGIN){ '' }
  end
end

