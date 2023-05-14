//
//  GreenhouseView.swift
//  Greenhouse_v1
//
//  Created by Tomás Veiga on 05/05/2023.
//

import SwiftUI

struct GreenhouseView: View {
    var greenhouse: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                ZStack(alignment: .top){
                    Image("greenhouse_vector")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                
                    Text("Greenhouse")
                        .bold().font(.system(size: 50))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                
                Spacer(minLength: 20)
                
                VStack{
                    if (greenhouse.feeds[0].temperature > 19){
                        VariableRow(logo: "thermometer.sun", name: "Temperature", value: (greenhouse.feeds[0].temperature.roundDouble()+"°"))
                    }
                    else if(greenhouse.feeds[0].temperature < 10){
                        VariableRow(logo: "thermometer.snowflake", name: "Temperature", value: (greenhouse.feeds[0].temperature.roundDouble()+"°"))
                    }
                    else{
                        VariableRow(logo: "thermometer.no_weather", name: "Temperature", value: (greenhouse.feeds[0].temperature.roundDouble()+"°"))
                    }
                    Spacer().frame(height: 10)
                        VariableRow(logo: "humidity", name: "Humidity", value: (greenhouse.feeds[0].humidity.roundInt()))
                    Spacer().frame(height: 10)
                        VariableRow(logo: "light.max", name: "Light", value: (greenhouse.feeds[0].light.roundInt()))
                    Spacer().frame(height: 10)
                        VariableRow(logo: "window.ceiling", name: "Window", value: (greenhouse.feeds[0].windowAngle.roundInt()))
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.6, saturation: 0.887, brightness: 0.557))
        .preferredColorScheme(.dark)
               
    }
    
}

struct GreenhouseView_Previews: PreviewProvider {
    static var previews: some View {
        GreenhouseView(greenhouse: previewGreenhouse)
    }
}
