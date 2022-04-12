//
//  Part8View.swift
//  HotProspects
//
//  Created by Nikolaj Søgaard Simonsen on 01/04/2022.
//

import SwiftUI
import UserNotifications

struct Part8View: View {
    var body: some View {
		VStack {
			Button("Request permission") {
				UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
					if success {
						print("All set")
					} else if let error = error {
						print(error.localizedDescription)
					}
				}
			}
			
			Button("Schedule notification") {
				let content = UNMutableNotificationContent()
				content.title = "Feed the dogs"
				content.subtitle = "They look hungry"
				content.sound = UNNotificationSound.default
				
				let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
				
				let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
				
				UNUserNotificationCenter.current().add(request)
			}
		}
    }
}

struct Part8View_Previews: PreviewProvider {
    static var previews: some View {
        Part8View()
    }
}
