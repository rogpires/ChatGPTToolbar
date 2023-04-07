//
//  SettingsView.swift
//  ChatGPTToolbar
//
//  Created by Rogerio Pires on 25/03/23.
//

import SwiftUI

struct SettingsView: View {
    
   // @State private var apikey = ""
    @AppStorage("apikey") var apikey = ""
    @State var api = ""
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                Label("Inserir a API KEY:", systemImage: "link")
                HStack {
                    
                    TextField("APIKEY...", text: $api)
                        .textFieldStyle(.roundedBorder)
                        .background(Material.ultraThin)
                    
                   
                    
                    Button ("Salvar") {
                        save()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                
                Spacer()
                Label(apikey, systemImage: "link")
                Section(header: Text("")){
                    Text("Copyright @ 2023 - Rogerio Pires")
                        .font(.caption)
                }
            }.padding()
           
        }
        .frame(width: 440, height: 340)
    }
    
    func save() {
        apikey = api
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
