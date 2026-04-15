//
//  MainTabView.swift
//  BloomMama
//
//  Created by Yashika Sharma on 14/02/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            
            NavigationStack {
                DashBoardView()
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            NavigationStack {
                MeTimeView()
                    .navigationTitle("Me Time")
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Me Time")
            }
        }
        .accentColor(.pink)
    }
}

#Preview {
    MainTabView()
}
