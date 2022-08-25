//
//  KeyChainTesterVC.swift
//  CoreData_Keychain
//
//  Created by Vasili Baramidze on 24.08.22.
//

import UIKit

class KeyChainTesterVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get
        //update
        //delete
        
    }
    //create
    @IBAction func addItem(_ sender: Any) {
        if textField.text?.isEmpty == false {
            //create
            print("🟢",textField.text!)
            KeyChainService.create(password: textField.text!.data(using: .utf8)!, account: "myExapmle@mail.com", service: "testService")
        }
    }
    
    @IBAction func getKeyChain(_ sender: Any) {
        let password = KeyChainService.getPassword(service: "testService", account: "myExapmle@mail.com")
        
        print(password)
    }
    
    @IBAction func edit(_ sender: Any) {
        
        KeyChainService.edit(service: "testService", account: "myExapmle@mail.com", password: "qwerty".data(using: .utf8)!)
    }
    
    @IBAction func remove(_ sender: Any) {
        KeyChainService.delete(service: "testService", account: "myExapmle@mail.com")
    }
    
    func createKeyChainData() {
        
    }

}


class KeyChainService {
    
    static func create(password: Data, account: String, service: String) {
        
        //query for add
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecSuccess {
            print("user password is saved")
        }
    }
    
    static func getPassword(service: String, account: String) -> String? {
        
        //query for get matching item
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        let data = result as? Data
        let stringValue = String(data: data!, encoding: .utf8)
        return stringValue
    }
    
    static func edit(service: String, account: String, password: Data) {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
        ]
        
        let attributes: [String: AnyObject] = [
            kSecValueData as String: password as AnyObject
        ]
        
        let status = SecItemUpdate(
            query as CFDictionary,
            attributes as CFDictionary
        )
        
        if status == errSecSuccess {
            print("updated")
        }
        
    }
    
    
    static func delete(service: String, account: String) {
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status == errSecSuccess {
            print("updated")
        }
    }
}
