//
//  ContentView.swift
//  random-number-generator
//
//  Created by Swagat Konchada on 08/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var fromNumber = "";
    @State private var toNumber = "";
    @State private var randomNumber = "";
    
    var body: some View {
        VStack {
            TextField("Enter lower limit", text: $fromNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Enter upper limit", text: $toNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                                        
                
            Button(action: {
                let fromNum = Int(self.fromNumber) ?? 0
                let toNum = Int(self.toNumber) ?? 0
                let range = toNum - fromNum
                let randomNum = Int(arc4random_uniform(UInt32(range))) + fromNum

                self.randomNumber = String(randomNum)
            }, label: {
                Text("Go!")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
            })
            .padding(.horizontal)
            .frame(height: 30.0)
            .background(Color.black)
            .cornerRadius(5.0)
            
            TextField("Random Number", text: $randomNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
