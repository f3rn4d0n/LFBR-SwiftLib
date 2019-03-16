//
//  Int+Extension.swift
//  ExtensionManager
//
//  Created by Luis Fernando Bustos Ramírez on 3/13/19.
//  Copyright © 2019 Gastando Tenis. All rights reserved.
//

import UIKit

class Int_Extension: NSObject {

}

extension Int{
    func getTimeByOffset() -> Date{
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
}
