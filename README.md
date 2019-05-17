# tracstuff: gtrac version: 0.8.1b
#
# gtrac /lib/common-lib              , low level methods, for loging ,colored messages and so on
#       /lib/common-gen-lib          , methods to generate a plain trac instance
#       /lib/common-plugins-lib      , methods to install plugins instance
#       /lib/common-custom-lib       , methods to customize specific part of the trac instance e.g logo, ..
#       /lib/plugins-lib             , methods to register plugins in trac.ini
#       /lib/gtrac-lib               , methods specific to gtrac   
#
# gtrac  is bash script which can generate a trac instance
# its install all necessary packages to do so.
# with some preconfigured users
# It can also configures logo's and trac style sheets
# It can installs also several plugins and set them in the trac.ini files
#
# Warning: this script has been tested with Centos 7 only

# Change URL path
# Author jdum
# Generation of a trac project
# version 0.8
#
# Changed URL path
# Clean up of previous trac project
# Add path global variables
# Add backup script on dum2
# Change path for test.conf
# Change realm warning AuthName must the same as the realm
# Add httpd project conf file genereric
# Add debug
# Add multiple users with trac permitions
# Add ticadmincustomfield
# Major code cleanup
# Add ExtraWiki plugin
# default values for tickets
# 0.7 add wikitopdf
# 0.7 add breadcrumbsnav
# 0.7 add tractags
#### 0.7 add graphviz
# 0.7 import/export ticket and wiki ICI
# 0.7 change trac style
# 0.7 add parsing command line paramters
# 0.7 command line debug with fine tuning
# 0.7 bash error handling
# 0.7 level of debug and clearer messages
# 0.7 add own browser tab ico
# 0.8 add exceldownload plugin
# 0.8 git integration
# 0.8 wiki imports / project
# 0.8 ticket imports
# 0.8 debug incremental messages

# 0.9 code review add commmentary !!!
# 0.9 XML config file
# 0.9 eggs in plugin dir
# 0.9 mod_python
# 0.9 improve debug
# 0.9 script generator

#
