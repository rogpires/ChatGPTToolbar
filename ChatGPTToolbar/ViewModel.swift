//
//  ViewModel.swift
//  ChatGPTToolbar
//
//  Created by Rogerio Pires on 07/04/23.
//

import Foundation
import SwiftUI

@MainActor
final class ViewModel: ObservableObject{
    @Published var apikey: String
    @Published var api: String
    
    init(apikey: String, api: String){
        self.apikey = apikey
        self.api = api
    }
    
    func save() {
        apikey = api
    }
}
