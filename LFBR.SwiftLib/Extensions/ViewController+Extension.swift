//
//  ViewController+ExtensionViewController.swift
//  ExtensionManager
//
//  Created by Luis Fernando Bustos Ramírez on 3/13/19.
//  Copyright © 2019 Gastando Tenis. All rights reserved.
//

import UIKit

class ViewController_Extension: UIViewController {

    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.endEditing(true)
    }

}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func hideKeyboardWhenTappedIn(currentView: UIView){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        currentView.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func  heightKeyboard() -> CGFloat{
        if UIDevice().userInterfaceIdiom == .phone {
            switch IPHONE_DEVICE{
            case .IPHONE_4:
                return 245.0
            case .IPHONE_5:
                return 250.0
            case .IPHONE_6:
                return 256.0
            case .IPHONE_6_PLUS:
                return 267.0
            case .IPHONE_X:
                return 298.0
            case .IPHONE_UNKNOWN:
                break
            }
        }
        return 256.0
    }
    
    
}
