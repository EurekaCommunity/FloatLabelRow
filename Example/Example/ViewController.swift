//
//  ViewController.swift
//  Example
//
//  Copyright © 2016 Xmartlabs SRL. All rights reserved.
//

import UIKit
import FloatLabelRow
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        form +++ Section()
           
            <<< TextFloatLabelRow { row in
                row.title = "Text field"
            }
            <<< IntFloatLabelRow { row in
                row.title = "Int field"
            }
            <<< DecimalFloatLabelRow { row in
                row.title = "Decimal field"
            }
            <<< URLFloatLabelRow { row in
                row.title = "URL field"
            }
            <<< TwitterFloatLabelRow { row in
                row.title = "Twitter field"
            }
            <<< AccountFloatLabelRow { row in
                row.title = "Account field"
            }
            <<< PasswordFloatLabelRow { row in
                row.title = "Password field"
            }
            <<< NameFloatLabelRow { row in
                row.title = "Name field"
            }
            <<< EmailFloatLabelRow { row in
                row.title = "Email field"
            }
            <<< PhoneFloatLabelRow { row in
                row.title = "Phone field"
            }
            <<< ZipCodeFloatLabelRow { row in
                row.title = "Zip code field"
            }
        
    }

}
