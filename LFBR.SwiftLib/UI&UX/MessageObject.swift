//
//  MesssageObject.swift
//  ExtensionManager
//
//  Created by Luis Fernando Bustos Ramírez on 19/01/18.
//  Copyright © 2018 Luis Fernando Bustos Ramírez. All rights reserved.
//

import UIKit

final class MessageObject: NSObject {
    
    static let sharedInstance = MessageObject()
    
    private override init() {super.init()}
    
    func showMessage(_ message:String, title:String, okMessage:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: okMessage, style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        if okMessage.count > 0{
            alertController.addAction(okAction)
        }
        
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController.init()
        window.windowLevel = UIWindow.Level.alert+1
        window.makeKeyAndVisible()
        window.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ message:String, title:String, okAction:UIAlertAction){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(okAction)
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController.init()
        window.windowLevel = UIWindow.Level.alert+1
        window.makeKeyAndVisible()
        window.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ message:String, title:String, okAction:UIAlertAction, cancelAction:UIAlertAction){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController.init()
        window.windowLevel = UIWindow.Level.alert+1
        window.makeKeyAndVisible()
        window.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ message:String, title:String, okAction:UIAlertAction, cancelMessage:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: cancelMessage, style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(cancelAction)
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController.init()
        window.windowLevel = UIWindow.Level.alert+1
        window.makeKeyAndVisible()
        window.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showMessageWithTextView(_ message:String, title:String, okMessage:String, cancelMessage:String, textPlaceHolder:String, completion:@escaping(String) ->Void){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = textPlaceHolder
            textField.clearButtonMode = .whileEditing
        }
        let cancelAction = UIAlertAction(title: cancelMessage, style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            completion("")
        }
        let submitAction = UIAlertAction(title: okMessage, style: .default, handler: { (action) -> Void in
            let textField = alertController.textFields![0]
            completion(textField.text!)
        })
        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController.init()
        window.windowLevel = UIWindow.Level.alert+1
        window.makeKeyAndVisible()
        window.rootViewController?.present(alertController, animated: true, completion: nil)
    
    }
}
