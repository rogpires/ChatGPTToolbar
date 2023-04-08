//
//  ContentView.swift
//  ChatGPTToolbar
//
//  Created by Rogerio Pires on 20/03/23.
//

import SwiftUI
import OpenAISwift

struct ContentView: View {
    
    @State private var search: String = ""
    @State private var isSearching: Bool = false
    @State private var isShowSettings: Bool = false
    var key = "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"
    
    
    @State private var responses: [String] = []
    
    private var isFormValid: Bool {
        !search.isEmpty
    }
    
    private func performSearch() {
        responses.append("You: \(search) ")
        
        OpenAISwift(authToken: key).sendCompletion(with: search, maxTokens: 500){ result in
            
            switch result {
            case .success(let success):
                let response = "ChatGPT: \(success.choices.first?.text ?? "")"
                responses.append(response)
                
                search = ""
                isSearching = false
                
            case .failure(let failure):
                print(failure.localizedDescription)
                isSearching = false
                
                
                
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $search)
                    .textFieldStyle(.roundedBorder)
                
                ///Button Search
                Button {
                    performSearch()
                    isSearching = true
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45))
                }.buttonStyle(.borderless)
                    .tint(.blue)
                    .disabled(!isFormValid)
                    .keyboardShortcut(.defaultAction) //whait return key
            }
            
            
            ///Scrool Results
            ScrollView {
                List(responses, id: \.self) { response in
                    Text(response)
                }.listStyle(.plain)
                    .textSelection(.enabled)
            }
            .overlay(alignment: .center) {
                if isSearching {
                    ProgressView("Searching...")
                }
            }
            
            HStack {
                
                ///Button Clear
                Button(action: {
                    self.responses.removeAll()
                }) {
                    Text("Clear")
                        .frame(maxWidth: .infinity)
                }.frame(maxWidth: .infinity)
                
                ///Button quit
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                    Text("Quit")
                        .frame(maxWidth: .infinity)
                }.frame(maxWidth: .infinity)
                
                ///Button Settings
                Button {
                    isShowSettings = true
                } label: {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .clipShape(Circle())
                }
                .popover(isPresented: $isShowSettings) {
                    SettingsView()
                }
                
            }
            
            Text("@rogeriocpires @irmandadeSwift")
                .foregroundColor(.secondary)
            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
