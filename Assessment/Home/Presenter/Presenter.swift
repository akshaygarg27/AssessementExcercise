//
//  Presenter.swift
//  Assessment
//
//  Created by Omika Garg on 10/10/19.
//  Copyright © 2019 Akshay Garg. All rights reserved.
//

import Foundation

final public class Presenter {
    
    class func fetchExerciseData(handler: @escaping ((_ exercise: ExerciseViewModel?, _ success: Bool) -> Void)) {
        
        guard let url = URL(string: "https://no89n3nc7b.execute-api.ap-southeast-1.amazonaws.com/staging/exercise") else { return }
        let request = NSMutableURLRequest(url: url)
        
        WebServiceClass.sharedInstance.getMethod(request: request) { (success, data) in
            if success, let json = data as? Dictionary<String, AnyObject> {
                DispatchQueue.main.sync {
                    let exercise: ExerciseViewModel = Exercise(json)
                    handler(exercise, true)
                }
            } else {
                /// Need to handle error.
                handler(nil, false)
            }
        }
    }
}

