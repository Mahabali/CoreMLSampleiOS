//
//  ContentView.swift
//  TestCoreML
//
//  Created by Dhilip on 18/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue: Float = 0
    @State private var outputValue: Float = 0
    init(){
       predictValue()
    }
    var body: some View {
        NavigationView {
           
        VStack(alignment: HorizontalAlignment.center, spacing: 50.0) {
            Text("Input Slider : \(inputValue, specifier: "%.2f")").font(Font.system(size: 20.0))
        Slider(
               value: $inputValue,
               in: 1...30,
               step: 0.1
           ) {
               Text("")
           } minimumValueLabel: {
               Text("0")
           } maximumValueLabel: {
               Text("30")
           } onEditingChanged: { isDragging in
               if(!isDragging){
                   predictValue()
               }
           }.padding()
            Text(" Predicted Value :\(outputValue, specifier: "%.2f")").font(Font.system(size: 20.0)).bold()
        }
        .navigationTitle("TestCoreML")
        }
    }
    
    
}

extension ContentView{
    func predictValue(){
        let input = InputFeatureProvider(input: inputValue)
        let mlProvider = MLProvider()
        do{
        let result = try mlProvider.predict(input: input)
        outputValue = result
            print("result \(result)")
        }catch{
            debugPrint("error \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
