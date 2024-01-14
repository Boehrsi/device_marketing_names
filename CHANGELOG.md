## 0.8.0
* Update min SDK requirement to 2.15.0
* Fix deprecation warnings

## 0.7.2

* Update database (via https://github.com/Boehrsi/device_identifiers at 2024-01-14)
* Update dependencies

## 0.7.1

* Update database (via https://github.com/Boehrsi/device_identifiers at 2023-10-22)
* Update dependencies

## 0.7.0

* Optimize library loading
* Update database (via https://github.com/Boehrsi/device_identifiers at 2023-09-09)
* Update dependencies

## 0.6.7

* Update database (via https://github.com/Boehrsi/device_identifiers at 2023-07-30)

## 0.6.6

* Update database (via https://github.com/Boehrsi/device_identifiers at 2023-07-02)
* Update dependencies

## 0.6.5

* Update database (via https://github.com/Boehrsi/device_identifiers at 2023-06-04)
* Update dependencies

## 0.6.4

* Update dependencies
* Update documentation
* Update example

## 0.6.3

* Update database (via https://github.com/Boehrsi/device_identifiers at 2023-04-30)
* Update dependencies

## 0.6.2

* Update database (via https://github.com/Boehrsi/device_identifiers at 2023-03-19)

## 0.6.1

* Update database (via https://github.com/Boehrsi/device_identifiers at 2023-02-12)
* Update dependencies

## 0.6.0

* Remove deprecated methods (fix https://github.com/Boehrsi/device_marketing_names/issues/5)
* Update dependencies

## 0.5.2

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-12-01)
* Update dependencies

## 0.5.1

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-10-30)
* Update dependencies

## 0.5.0

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-10-10)
* Update dependencies (including major device_info_plus update)

## 0.4.4

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-09-18)
* Update dependencies

## 0.4.3

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-08-21)
* Update dependencies

## 0.4.2

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-07-17)
* Update dependencies

## 0.4.1

* Update database (via https://github.com/Boehrsi/device_identifiers at 2022-06-05)
* Update dependencies

## 0.4.0
* Add new methods getNames(), getNamesAsList(), getSingleName() and getNamesFromModel(), getNamesFromModelAsList(), getSingleNameFromModel()
* Device lookups now always return a non-null value. If no name was found, the provided model will be returned   
* Deprecate getMarketingName() and getMarketingNameFromModel(). These methods will be removed in version 0.6.0
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
