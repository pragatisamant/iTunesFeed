//
//  RequestHandler.swift
//  RebelTestPragati
//
//  Created by Pragati Samant on 20/07/19.
//  Copyright © 2019 Pragati. All rights reserved.
//

import Foundation
import Alamofire
//import AlamofireImage

class RequestHandler<U:Codable> {
    func testDecoder() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
      
        let jsonData =  testjson.data(using: .utf8)!
       // JSONDecoder().dataDecodingStrategy = .base64
        do {
        let user = try JSONDecoder().decode(ItunesModel.self, from: jsonData)
            print(user.feed.results.count)
        }catch {
            print(error)
        }
        
    }
    var closure = { (response : Data?,completion : ((U?,Error?)->())?) in
        do {
            let u  = try JSONDecoder().decode(U.self, from: (response ?? nil)!)
            completion?(u,nil)
        }catch {
            completion?(nil,error)
        }
    }
    func myRequest<T>(_ urlString:String,params:T?,_ completion:((U?,Error?)->())?) {
      //  let parameters: Parameters? = nil //JSONAble.toDict(params)
        Alamofire.request( urlString).response {[unowned self] response in
            print(response)
            self.closure(response.data,completion)
        }.resume()
    }
}
class DataRequestHandler{
    static func fetchImage(_ imageUrl:String,completion:@escaping (Data?,Error?)->()) {
        URLSession.shared.dataTask(with: URL(string:imageUrl)!,completionHandler:{ (data, response, error) in
            DispatchQueue.main.async {
                completion(data,error)
            }
        }).resume()
    }

}



