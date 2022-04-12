//
//  Part3View.swift
//  Bucketlist
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 02/03/2022.
//

import SwiftUI

enum LoadingState1 {
	case loading
	case success
	case failed
}

struct LoadingView: View {
	var body: some View {
		Text("Loading")
	}
}

struct SuccessView: View {
	var body: some View {
		Text("Success")
	}
}

struct FailedView: View {
	var body: some View {
		Text("Failed")
	}
}

struct Part3View: View {
	var loadingState = LoadingState1.loading
	
	var body: some View {
		switch loadingState {
		case .loading:
			LoadingView()
		case .success:
			SuccessView()
		case .failed:
			FailedView()
		}
	}
}

struct Part3View_Previews: PreviewProvider {
    static var previews: some View {
        Part3View()
    }
}
