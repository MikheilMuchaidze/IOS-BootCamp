//
//  Userdefaults+Extension.swift
//  PersistanceInIOS
//
//  Created by Vasili Baramidze on 22.08.22.
//

import Foundation


extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case textFieldText
        case randomHuman
    }
    
    var textFieldText: String? {
        
        get {
            string(forKey: UserDefaults.UserDefaultsKeys.textFieldText.rawValue)
        }
        
        set {
            set(newValue, forKey: UserDefaults.UserDefaultsKeys.textFieldText.rawValue)
        }
    }
    
    var randomHuman: Human? {
        get {
            let data = object(forKey: UserDefaults.UserDefaultsKeys.randomHuman.rawValue)
            let human = try? JSONDecoder().decode(Human.self, from: data! as! Data)
            return human
        }
        
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.setValue(data, forKey: UserDefaults.UserDefaultsKeys.randomHuman.rawValue)
        }
    }
    
}
