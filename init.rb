Redmine::Plugin.register :redmine_shared_api do
  name 'Redmine Better Custom Field API'
  author 'SmallCubed Inc'
  description 'This is a plugin share API for Redmine Outlook Add-In, QuickBooks, etc..' 
  version '0.1.0'
  url 'https://github.com/smallcubed/redmine_custom_field_api'
  author_url 'http://smallcubed.com'
  requires_redmine :version_or_higher => '2.4.0'
end
