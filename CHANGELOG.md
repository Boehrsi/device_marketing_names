## 0.4.2

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-07-17)
* Update dependencies

## 0.4.1

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-06-05)
* Update dependencies

## 0.4.0
* Add new methods getNames(), getNamesAsList(), getSingleName() and getNamesFromModel(), getNamesFromModelAsList(), getSingleNameFromModel()
* Device lookups now always return a non-null value. If no name was found, the provided model will be returned   
* Deprecate getMarketingName() and getMarketingNameFromModel(). These methods will be removed in version 0.5.0
* Reduced database size
* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-04-25)
* Update dependencies
* Update documentation
* Update example app
* Update tests

## 0.3.3

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-03-13)
* Update dependencies

## 0.3.2

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-02-06)
* Update dependencies
* Update example app

## 0.3.1

* Update database
* Update dependencies  
* Update example app

## 0.3.0

* Update to device_identifiers version 0.2.0 (https://github.com/Boehrsi/device_identifiers/releases/tag/0.2.0)
* Update database

## 0.2.1

* Fix web lookup
* Update documentation

## 0.2.0

* Breaking: renamed `DeviceNames` to `DeviceMarketingNames`
* Breaking: return `null` on not supported platforms, instead of throwing an exception
* Add support for web. The browser name delivered by device_info_plus is forwarded
* Add code documentation  
* Extend testing

## 0.1.0

* Initial version
* Added lookup for the current device name
* Added lookup for device name by model
