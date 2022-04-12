//
//  Part5View.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 03/03/2022.
//

import LocalAuthentication
import SwiftUI

struct Part5View: View {
	@State private var isUnlocked = false
	
    var body: some View {
		VStack {
			if isUnlocked {
				Text("Unlocked")
			} else {
				Text("Locked")
			}
		}
		.onAppear(perform: authendicate)
    }
	
	func authendicate() {
		let context = LAContext()
		var error: NSError?
		
		if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
			let reason = "We need to unlock your data"
			
			context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authendicationError in
				if success {
					isUnlocked = true
				} else {
					
				}
			}
		} else {
			// No biometrics
		}
	}
}

struct Part5View_Previews: PreviewProvider {
    static var previews: some View {
        Part5View()
    }
}
