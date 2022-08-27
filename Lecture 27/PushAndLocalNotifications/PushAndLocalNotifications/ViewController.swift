//
//  ViewController.swift
//  PushAndLocalNotifications
//
//  Created by Vasili Baramidze on 26.08.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendPushAction(_ sender: Any) {
        LocalLocationManager.register(notification: LocalNotification(id: UUID().uuidString , title: "local notification", message: "see info"), duration: 1, repeats: false, userInfo: ["name": [1,2,3,3]])
    }
}

