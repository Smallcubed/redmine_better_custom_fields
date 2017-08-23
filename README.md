Redmine Better Custom Fields API
-------

This is a Redmine plugin that provides a better, more complete API for custom fields.

### New endpoint

* [GET] /better/custom_fields.xml | .json

This will include the projects for which the issue custom field should be available. It is intended to be used with the Zendesk plugin [RedminePro](https://smallcubed.com/rmp).


How to use
-------
```
  $ cd /path/to/redmine/plugins
  $ git clone https://github.com/smallcubed/redmine_better_custom_fields.git
```
Then restart redmine.

Compatible with:	Redmine 4.0.x, 3.2.x, 3.1.x, 3.0.x, 2.6.x, 2.5.x

License
-------

This plugin is released under the GPL v2 license. See
LICENSE for more information.

Powered by [SmallCubed](http://smallcubed.com) 
