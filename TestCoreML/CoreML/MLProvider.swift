//
//  MLProvider.swift
//  TestCoreML
//
//  Created by Dhilip on 18/03/22.
//

import Foundation
import CoreML
class MLProvider{
    var model: MLModel!

    init(){
        initiliazeModel()
    }
    
    func initiliazeModel(){
        let bundle = Bundle.main
        let url = bundle.url(forResource: "SampleMLModel", withExtension:"mlmodelc")!
            do{
          model = try MLModel(contentsOf: url)
            } catch{
               debugPrint("Error in initializing model - \(error)")
            }
    }
    
    func predict(input:InputFeatureProvider) throws -> Float {
        let output = try model.prediction(from: input)
        let multiArray = output.featureValue(for: "Output")
        if let result = multiArray?.multiArrayValue?[0]{
            return result.floatValue
        }
        else{
            debugPrint("Error in prediction")
        }
        return 0.0
    }
}
