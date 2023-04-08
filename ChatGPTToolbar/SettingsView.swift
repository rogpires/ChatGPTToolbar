//
//  SettingsView.swift
//  ChatGPTToolbar
//
//  Created by Rogerio Pires on 25/03/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("apikey") var apikey = ""
    @State var api = ""
    
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                Label("Insert API KEY:", systemImage: "key")
                HStack {
                    
                    TextField("APIKEY...", text: $api)
                        .textFieldStyle(.roundedBorder)
                    
                    Button ("Salvar") {
                        save()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                
                Spacer()
                
                Label(apikey, systemImage: "key")
                    .padding()
                Section(header: Text("")){
                    Text("ChatGPT API KEY: https://platform.openai.com/")
                    Text("Copyright @ 2023 - Rogerio Pires | www.irmandadeswift.com")
                        .font(.caption)
                }
            }.padding()
            
        }
        .frame(width: 400, height: 300)
    }
    
    ///func save 
    func save() {
        apikey = api
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
