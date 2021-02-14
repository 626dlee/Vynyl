//
//  ArrayFlattener.swift
//  DavidLee_Vynyl
//
//  Created by David Lee on 2/13/21.
//


import Foundation
class ArrayFlattener: NSObject {

    func flattenArray(_ arr: [Any]) -> [String] {
        
        // array structure that we use to hold data to be returned
        var answer: [String] = []
        
        // loop through input
        for element in arr {
            
            // check if current element is the desired data type
            if let element = element as? String {
                // append to answer if it is correct data type
                answer.append(element)
            }
            
            // check if current element is an array
            if let element = element as? [Any] {
                // recursive call to flattenArray to flatten the current array
                let subElements = flattenArray(element)
                // append subelements to the answer
                for j in subElements {
                    answer.append(j)
                }
            }
        }
        return answer
    }
}
