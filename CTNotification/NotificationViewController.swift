//
//  NotificationViewController.swift
//  CTNotificationContent
//
//  Created by Chetan Ashtivkar on 09/08/22.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import CTNotificationContent
import CleverTapSDK

class NotificationViewController: CTNotificationViewController {

    override func viewDidLoad() {
          super.viewDidLoad()
      }
      
      // optional: implement to get user event data
      override func userDidPerformAction(_ action: String, withProperties properties: [AnyHashable : Any]!) {
          print("userDidPerformAction \(action) with props \(String(describing: properties))")
      }
      
      // optional: implement to get notification response
      override func userDidReceive(_ response: UNNotificationResponse?) {
          print("Push Notification Payload \(String(describing: response?.notification.request.content.userInfo))")
          let notificationPayload = response?.notification.request.content.userInfo
          if (response?.actionIdentifier == "action_2") {
              CleverTap.sharedInstance()?.recordNotificationClickedEvent(withData: notificationPayload ?? "")
          }
      }
}
