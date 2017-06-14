# FloatLabelRow

<p align="left">
<a href="https://travis-ci.org/KarinaFernandez/FloatLabelRow"><img src="https://travis-ci.org/KarinaFernandez/FloatLabelRow.svg?branch=master" alt="Build status" /></a>
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-4BC51D.svg?style=flat" alt="Swift 3 compatible" /></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" /></a>
<a href="https://cocoapods.org/pods/XLActionController"><img src="https://img.shields.io/cocoapods/v/FloatLabelRow.svg" alt="CocoaPods compatible" /></a>
<a href="https://raw.githubusercontent.com/KarinaFernandez/FloatLabelRow/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

By [Xmartlabs SRL](http://KarinaFernandez.com).

## Introduction

FloatLabelRow is an Eureka custom row that shows a float label.

<p align='center'>
  <img src='https://github.com/EurekaCommunity/FloatLabelRow/blob/1.0.0/Example/floatLabelRow.gif?raw=true' alt='FloatLabelRow example'/>
</p>

## Usage

```swift
import Eureka
import FloatLabelRow


class ExampleViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section()
            <<< TextFloatLabelRow() {
                $0.title = "Text Field"
                $0.value = "Placeholder"
            }
            <<< IntFloatLabelRow() {
                $0.title = "Int field"
                $0.value = 2017
            }
            <<< DecimalFloatLabelRow() {
                $0.title = "Decimal field"
                $0.value = 2017
                $0.formatter = DecimalFormatter()
                $0.useFormatterDuringInput = true
            }
            +++ Section()
            <<< DecimalFloatLabelRow() {
                $0.title = "Scientific style"
                $0.value = 2017
                let formatter = NumberFormatter()
                formatter.locale = .current
                formatter.numberStyle = .scientific
                $0.formatter = formatter
            }
            <<< IntFloatLabelRow() {
                $0.title = "Spell out style"
                $0.value = 2017
                let formatter = NumberFormatter()
                formatter.locale = .current
                formatter.numberStyle = .spellOut
                $0.formatter = formatter
        }
    }

}
```

## Requirements

* iOS 9.0+
* Xcode 8.0+
* Eureka 3.0+

## Getting involved

* If you **want to contribute** please feel free to **submit pull requests**.
* If you **have a feature request** please **open an issue**.
* If you **found a bug** or **need help** please **check older issues, [FAQ](#faq) and threads on [StackOverflow](http://stackoverflow.com/questions/tagged/FloatLabelRow) (Tag 'FloatLabelRow') before submitting an issue.**.

Before contribute check the [CONTRIBUTING](https://github.com/KarinaFernandez/FloatLabelRow/blob/master/CONTRIBUTING.md) file for more info.

If you use **FloatLabelRow** in your app We would love to hear about it! Drop us a line on [twitter](https://twitter.com/KarinaFernandez).

## Examples

Follow these 3 steps to run Example project: Clone FloatLabelRow repository, open FloatLabelRow workspace and run the *Example* project.

You can also experiment and learn with the *FloatLabelRow Playground* which is contained in *FloatLabelRow.workspace*.

## Installation

#### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects.

To install FloatLabelRow, simply add the following line to your Podfile:

```ruby
pod 'FloatLabelRow', '~> 1.0'
```

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a simple, decentralized dependency manager for Cocoa.

To install FloatLabelRow, simply add the following line to your Cartfile:

```ogdl
github "EurekaCommunity/FloatLabelRow" ~> 1.0
```

## Author

* [Xmartlabs SRL](https://github.com/xmartlabs) ([@xmartlabs](https://twitter.com/xmartlabs))


# Change Log

This can be found in the [CHANGELOG.md](CHANGELOG.md) file.
