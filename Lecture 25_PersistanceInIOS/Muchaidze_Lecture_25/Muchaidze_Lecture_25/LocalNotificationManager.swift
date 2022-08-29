import Foundation
import UIKit
import UserNotifications

struct LocalNotification {
    let id: String
    let title: String
    let message: String
}

struct LocalLocationManager {
    
    static func register(notifications: LocalNotification, duration: Int, repeats: Bool, userInfo: [AnyHashable : Any]) {
        let userNotification = UNUserNotificationCenter.current()
        
        //Get permission status
        userNotification.requestAuthorization(options: [.badge, .alert]) { granted, error in
            if granted {
                print("User accpted push notification")
                DispatchQueue.main.async {
                    addNotification(notifications: notifications, duration: duration, repeats: repeats, userInfo: userInfo)
                }
            }
        }
        
    }
    
    static func addNotification(notifications: LocalNotification, duration: Int, repeats: Bool, userInfo: [AnyHashable : Any]) {
        
        let content = UNMutableNotificationContent()
        content.title = notifications.title
        content.body = notifications.message
        content.userInfo = userInfo
        content.sound = UNNotificationSound.default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(duration), repeats: repeats)
        
        let request = UNNotificationRequest(identifier: notifications.id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { error in
            guard error == nil else { return }
        }
        
    }
    
}
