//
//  ChatGPTToolbarApp.swift
//  ChatGPTToolbar
//
//  Created by Rogerio Pires on 20/03/23.
//

import SwiftUI
import HotKey

@main
struct ChatGPTToolbarApp: App {
    
    var hotKey = HotKey(key: .r, modifiers: [.command, .option])
    
    
    var body: some Scene {
        
        MenuBarExtra("UtilityApp", systemImage: "brain") {
            ZStack {
                ContentView()
            }
            .frame(width: 500, height: 400)
            
        }.menuBarExtraStyle(.window)
        

          
    }
    
}

