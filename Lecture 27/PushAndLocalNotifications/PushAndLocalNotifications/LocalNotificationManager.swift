//
//  LocalNotificationManager.swift
//  PushAndLocalNotifications
//
//  Created by Vasili Baramidze on 26.08.22.
//

import Foundation
import UserNotifications
import UIKit

/*
 https://github.com/twostraws/ControlRoom
 
 მოცემულ აპლიკაციას აქვს მრავალმხრივი გამოყენება,
 არ წარმოიდგინოთ რომ მხოლოდ ფუშების გასატესტად გამოიყენება.
 
 */

struct LocalNotification {
    let id: String
    let title: String
    let message: String
}

struct LocalLocationManager {
    
    static func register(notification: LocalNotification,duration: Int, repeats: Bool, userInfo: [AnyHashable : Any]) {
        let userNotification = UNUserNotificationCenter.current()
        //Get Permission status
        userNotification.requestAuthorization(options: [.badge,.alert]) { granted, error in
            if granted {
                print("თანახმაა ფუშზე 🟢")
                DispatchQueue.main.async {
                    addNotification(notification: notification, duration: duration, repeats: repeats, userInfo: userInfo)
                }
            }
        }
    }
    
    static func addNotification(notification: LocalNotification,duration: Int, repeats: Bool, userInfo: [AnyHashable : Any]) {
        
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.body = notification.message
        content.sound = UNNotificationSound.default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        content.userInfo = userInfo
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(duration), repeats: repeats)
        
        let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { error in
            
            guard error == nil else {
                return
            }
        }
    }
}

