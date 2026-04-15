//
//  ContentView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 07/04/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasStarted") private var hasStarted = false
    
    var body: some View {
        if hasStarted {
            MainTabView()
        } else {
            MainView(hasStarted: $hasStarted)
        }
    }
}

#Preview {
    ContentView()
}
