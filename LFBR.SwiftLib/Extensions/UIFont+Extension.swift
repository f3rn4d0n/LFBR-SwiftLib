//
//  UIFont+Extension.swift
//  ExtensionManager
//
//  Created by Luis Fernando Bustos Ramírez on 3/13/19.
//  Copyright © 2019 Gastando Tenis. All rights reserved.
//

import UIKit

class UIFont_Extension: NSObject {

}

extension UIFont {
    
    enum fontType{
        case MAIN_ACTIONS
    }
    
    static let fontForActionsOnMain = UIFont(fontType: .MAIN_ACTIONS)
    
    convenience init(fontType: fontType) {
        if IPHONE_DEVICE == .IPHONE_5 {
            self.init(name: "Lato-Bold", size: 10)!
            return
        }
        self.init(name: "Lato-Bold", size: 14)!
    }
}
