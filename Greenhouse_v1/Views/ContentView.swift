//
//  ContentView.swift
//  Greenhouse_v1
//
//  Created by Tomás Veiga on 05/05/2023.
//

import SwiftUI

struct ContentView: View {
    var greenhouseManager = GreenhouseManager()
    @State var greenhouse: ResponseBody?
    
    var body: some View {
        VStack{
            if let greenhouse = greenhouse {
                GreenhouseView(greenhouse: greenhouse)
            } else {
                LoadingView()
                    .task {
                        do{
                            greenhouse = try await greenhouseManager.getCurrentGreenhouseStats()
                        } catch{
                            print("Error getting greenhouse: \(error)")
                        }
                    }
            }
        }
        .background(Color(hue: 0.6, saturation: 0.887, brightness: 0.557))
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
