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
    
    let openAI = OpenAISwift(authToken: "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")
    
    @State private var responses: [String] = []
    
    private var isFormValid: Bool {
        !search.isEmpty
    }
    
    private func performSearch() {
        responses.append("You: \(search) ")
        
        openAI.sendCompletion(with: search, maxTokens: 500) { result in
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
            
            
            
            ScrollView {
                List(responses, id: \.self) { response in
                    Text(response)
                }.listStyle(.plain)
                    .textSelection(.enabled)
            }
            //   .padding()
            
            .overlay(alignment: .center) {
                if isSearching {
                    ProgressView("Searching...")
                }
            }
            
            HStack {
                
                Button(action: {
                    self.responses.removeAll()
                }) {
                    Text("Clear")
                        .frame(maxWidth: .infinity)
                }.frame(maxWidth: .infinity)
                
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                    Text("Quit")
                        .frame(maxWidth: .infinity)
                }.frame(maxWidth: .infinity)
                
                
                
                //                Button {
                //
                //                } label: {
                //                    Image(systemName: "gear")
                //                        .font(.title)
                //                }.buttonStyle(.borderless)
                //                    .disabled(!isFormValid)
                
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
