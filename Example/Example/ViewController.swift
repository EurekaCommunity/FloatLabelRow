//
//  ViewController.swift
//  Example
//
//  Copyright © 2016 Xmartlabs SRL. All rights reserved.
//

import Eureka
import FloatLabelRow
import UIKit

//MARK: HomeViewController
class HomeViewController : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++
            Section() { section in
                let header = HeaderFooterView<UIView>(.nibFile(name: "Header", bundle: Bundle.main))
                section.header = header
            }
            <<< ButtonRow("Field row label examples") {
                $0.title = $0.tag
                $0.presentationMode = .segueName(segueName: "RowsExampleViewControllerSegue", onDismiss: nil)
            }
            <<< ButtonRow("Formatters examples") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "FormattersControllerSegue", onDismiss: nil)
            }
    }
    
}

// MARK: Class RowsExampleViewController - Default provided FieldRow types
class RowsExampleViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++
            Section(header: "Field Row Label examples", footer: "Field rows provided by default")
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
                <<< URLFloatLabelRow() {
                    $0.title = "URL field"
                    $0.value = URL(string: "http://xmartlabs.com")
                }
                <<< TwitterFloatLabelRow() {
                    $0.title = "Twitter field"
                    $0.value = "@xmartlabs"
                }
                <<< AccountFloatLabelRow() {
                    $0.title = "Account field"
                    $0.value = "Xmartlabs"
                }
                <<< PasswordFloatLabelRow() {
                    $0.title = "Password field"
                    $0.value = "password"
                }
                <<< NameFloatLabelRow() {
                    $0.title = "Name field"
                    $0.value = "Xmartlabs"
                }
                <<< EmailFloatLabelRow() {
                    $0.title = "Email field"
                    $0.value = "hello@xmartlabs"
                }
                <<< PhoneFloatLabelRow() {
                    $0.title = "Phone field (disabled)"
                    $0.value = "+598 9898983510"
                    $0.disabled = true
                }
                <<< ZipCodeFloatLabelRow() {
                    $0.title = "Zip code field"
                    $0.value = "90210"
                }
    }
    
}

//MARK: Class FormatterExample - Native and Custom formatters
class FormatterExample : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        form +++
            Section(header: "Number formatters", footer: "Native formatters")
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
                <<< DecimalFloatLabelRow() {
                    $0.title = "Energy: Jules to calories"
                    $0.value = 100.0
                    let formatter = EnergyFormatter()
                    $0.formatter = formatter
                }
                <<< IntFloatLabelRow() {
                    $0.title = "Weight: Kg to lb"
                    $0.value = 1000
                    $0.formatter = MassFormatter()
                }
            
            +++ Section(header: "Custom formatter", footer: "Custom formatter: CurrencyFormatter")
                <<< DecimalFloatLabelRow() {
                    $0.title = "Currency style"
                    $0.value = 2000.00
                    $0.useFormatterDuringInput = true
                    let formatter = CurrencyFormatter()
                    formatter.locale = .current
                    formatter.numberStyle = .currency
                    $0.formatter = formatter
                }
    }

    class CurrencyFormatter : NumberFormatter, FormatterProtocol {
        
        override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, range rangep: UnsafeMutablePointer<NSRange>?) throws {
            guard obj != nil else { return }
            let str = string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
            obj?.pointee = NSNumber(value: (Double(str) ?? 0.0)/Double(pow(10.0, Double(minimumFractionDigits))))
        }
        
        func getNewPosition(forPosition position: UITextPosition, inTextInput textInput: UITextInput, oldValue: String?, newValue: String?) -> UITextPosition {
            return textInput.position(from: position, offset:((newValue?.characters.count ?? 0) - (oldValue?.characters.count ?? 0))) ?? position
        }
        
    }

}
