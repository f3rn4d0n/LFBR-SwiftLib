//
//  String+Extension.swift
//  ExtensionManager
//
//  Created by Luis Fernando Bustos Ramírez on 3/13/19.
//  Copyright © 2019 Gastando Tenis. All rights reserved.
//

import UIKit

class String_Extension: NSObject {

}

let __numberRegex = "^[0-9]\\d*(\\.\\d+)?$"
let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,6}"
public let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)
public let __numberPredicate = NSPredicate(format: "SELF MATCHES %@", __numberRegex)

public extension String {
    
    func encodeUrl() -> String?{
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String?{
        return self.removingPercentEncoding
    }
    
    func urlPercentEncoded(withAllowedCharacters allowedCharacters:
        CharacterSet, encoding: String.Encoding) -> String {
        var returnStr = ""
        
        // Compute each char seperatly
        for char in self {
            let charStr = String(char)
            let charScalar = charStr.unicodeScalars[charStr.unicodeScalars.startIndex]
            if allowedCharacters.contains(charScalar) == false,
                let bytesOfChar = charStr.data(using: encoding) {
                // Get the hexStr of every notAllowed-char-byte and put a % infront of it, append the result to the returnString
                for byte in bytesOfChar {
                    returnStr += "%" + String(format: "%02hhX", byte as CVarArg)
                }
            } else {
                returnStr += charStr
            }
        }
        
        return returnStr
    }
    
    func isURL () -> Bool {
        if let url = NSURL(string: self) {
            // check if your application can open the NSURL instance
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
    
    func isEmail() -> Bool {
        return __emailPredicate.evaluate(with: self)
    }
    
    func isNumber() -> Bool{
        return __numberPredicate.evaluate(with: self)
    }
    
    func toFloat(_ localeIdentifier: String? = nil) -> Float {
        let locale = localeIdentifier != nil ?  Locale(identifier: localeIdentifier!) : Locale.current
        
        let fmt = NumberFormatter()
        fmt.locale = locale
        fmt.numberStyle = .decimal
        fmt.maximumFractionDigits = 2
        fmt.roundingMode = .down
        
        return fmt.number(from: self)?.floatValue ?? 0
    }
    
    var int : Int {
        if self.isNumber() {
            return Int(self.split(separator: ".")[0]) ?? 0
        } else {
            return 0
        }
    }
    
    
    func sliderAttributeString(intFont: UIFont, decimalFont: UIFont, customDecimalSeparator: String? = nil) -> NSAttributedString {
        guard self != "" else { return NSAttributedString(string: "") }
        
        let locale = Locale.current
        let fmt = NumberFormatter()
        fmt.locale = locale
        fmt.decimalSeparator = customDecimalSeparator ?? fmt.decimalSeparator
        
        let numberComponents = components(separatedBy: fmt.decimalSeparator)
        
        let attributeString = NSMutableAttributedString()
        var integerStr = numberComponents[0]
        
        var decimalStr = ""
        if numberComponents.count > 1 {
            integerStr += fmt.decimalSeparator
            decimalStr =  numberComponents[1]
        }
        
        let integer = NSMutableAttributedString(string: integerStr)
        let decimal = NSMutableAttributedString(string: decimalStr)
        
        
        attributeString.append(integer)
        attributeString.append(decimal)
        
        return attributeString
    }
    
    
}

public extension NSString{
    func getdBoldedText(boldPartsOfString: Array<NSString>, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
        
        let nonBoldFontAttribute = [NSAttributedString.Key.font:font!]
        let boldFontAttribute = [NSAttributedString.Key.font:boldFont!]
        let boldString = NSMutableAttributedString(string: self as String, attributes:nonBoldFontAttribute)
        for i in 0 ..< boldPartsOfString.count {
            boldString.addAttributes(boldFontAttribute, range: self.range(of: boldPartsOfString[i] as String))
        }
        return boldString
    }
}
