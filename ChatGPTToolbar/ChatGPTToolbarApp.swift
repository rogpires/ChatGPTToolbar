//
//  ChatGPTToolbarApp.swift
//  ChatGPTToolbar
//
//  Created by Rogerio Pires on 20/03/23.
//

import SwiftUI

@main
struct ChatGPTToolbarApp: App {
    var body: some Scene {
        MenuBarExtra("UtilityApp", systemImage: "brain") {
            ZStack {
                ContentView()
            }
            .frame(width: 500, height: 400)
            
        }.menuBarExtraStyle(.window)
        
            //.keyboardShortcut("7", modifiers: [.command, .shift])
        
//            WindowGroup {
//
//            }
//
          
    }
}
