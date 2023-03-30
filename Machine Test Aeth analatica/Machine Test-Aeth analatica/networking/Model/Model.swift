//
//  Model.swift
//  Machine Test-Aeth analatica
//
//  Created by WC on 29/03/23.
//

import Foundation
class Model {
    var Author : String?
    var Height : Int?
    var Id : String?
    var Width : Int?
    var DowenlodUrl : String?
    var Url : String?
    
    init(fromdata : [String: Any]) {
        self.Author = fromdata["author"] as! String
        self.Height = fromdata["height"] as! Int
        self.Id = fromdata["id"] as? String
        self.Url = fromdata["url"] as? String
        self.Width = fromdata["width"] as? Int
        self.DowenlodUrl = fromdata["download_url"] as? String
        
    }
    
    
    
}
