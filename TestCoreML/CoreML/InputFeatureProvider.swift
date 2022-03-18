//
//  InputFeatureProvider.swift
//  TestCoreML
//
//  Created by Dhilip on 18/03/22.
//

import Foundation
import CoreML

class InputFeatureProvider:MLFeatureProvider{
    
    let inputValue:Float
    
    init(input value:Float){
        self.inputValue = value
    }
    
    var featureNames: Set<String> {
        get {
            return ["Input"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        do{
            let multiArray = try MLMultiArray(shape: [1,1], dataType: MLMultiArrayDataType.float32)
            multiArray[0] = NSNumber(value: inputValue)
         return MLFeatureValue(multiArray:multiArray)
            
        }catch{
            return nil
        }
    }
}
