//
//  SettingsViewModel.swift
//  ChatGPTToolbar
//
//  Created by Rogerio Pires on 07/04/23.
//

import Foundation

class ViewModel: ObservableObject {
    
   
    @Published private(set) var apikey = ""
    @Published private(set) var api = ""
    
    func save() {
        apikey = api
        
    }
}
