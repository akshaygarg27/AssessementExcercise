
import Foundation
import UIKit

class WebServiceClass {
    
    static let sharedInstance = WebServiceClass()
    
    //MARK:- Data task
    func dataTask(request: NSMutableURLRequest, method: String, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        // NSMutableURLRequest Methods
        request.httpMethod = method
        request.timeoutInterval = 60
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // Create url session
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        // Call session data task.
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in

            // Check Data
            if let data = data {
                
                // Json Response
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                // response.
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject?)
                } else {
                    completion(false, json as AnyObject?)
                }
                
            } else {
                completion(false, error?.localizedDescription as AnyObject?)
            }
            
        }.resume()
    }
    
    
    //MARK:- POST Methods
    public func postMethod(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", completion: completion)
    }
    
    //MARK:- PUT Methods
    public func putMethod(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", completion: completion)
    }
    
    //MARK:- GET Methods
    public func getMethod(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "GET", completion: completion)
    }
    
}



