//
//  File.swift
//  Machine Test-Aeth analatica
//
//  Created by WC on 29/03/23.
//

import Foundation
import UIKit
import CoreData
class DataModel {
    
    static let datamodel = DataModel()
    var userdata = [Entity]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func openDatabse(username: String,password: String) {
        
        let user = Entity(context: context)
        user.username = username
        user.password = password
        do{
            try context.save()
            print("ok")
        }catch{
            print("error")
        }
        
    }
    func fetch()  {
        do{
            
            let result = try context.fetch(Entity.fetchEntityRequest())
            
            self.userdata = result
            
            
            
        }catch{
            print("not fecthed")
            
        }
    }
    
}
