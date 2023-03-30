//
//  Network.swift
//  Machine Test-Aeth analatica
//
//  Created by WC on 29/03/23.
//

import Foundation
import Alamofire
class Network {
    static let network = Network()
    func getData(url: String,complition: @escaping(Data?,Bool,String)-> Void)  {
        AF.request(url,method: .get,encoding: JSONEncoding.default).responseData { (resp) in
            switch resp.result{
            
            case .success( let succ):
                complition(succ,true,"success")
            case .failure(let failur):
                complition(nil,false,"failiur")
            }
        }
    }
}
