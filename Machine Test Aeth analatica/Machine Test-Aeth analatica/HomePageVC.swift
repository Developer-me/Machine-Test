//
//  HomePageVC.swift
//  Machine Test-Aeth analatica
//
//  Created by WC on 28/03/23.
//

import UIKit
import Kingfisher
class HomePageVC: UIViewController {
    var model = [Model]()
    
    @IBOutlet weak var tblProdect: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api()
    }
    
    func api()  {
        Network.network.getData(url: "https://picsum.photos/v2/list") { (response, istrue, maessage) in
            if istrue == true{
                if let value = response {
                    print(value)
                    do{
                        let json = try JSONSerialization.jsonObject(with: value, options: [])
                        //                        print(json)
                        if let Getdata = json as? [[String : Any]] {
                            print(Getdata)
                            for i in Getdata {
                                self.model.append(Model(fromdata: i))
                            }
                            self.tblProdect.reloadData()
                        }
                        
                    }catch{
                        print("error")
                    }
                }
            }
            
        }
    }
    
    @IBAction func Logout(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension HomePageVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prodecttbl", for: indexPath) as! Prodecttbl
        //        cell.textLabel?.text = model[indexPath.row].DowenlodUrl
        cell.imgProdect.kf.setImage(with: URL(string: model[indexPath.row].DowenlodUrl ?? ""))
        cell.imgProdect.layer.cornerRadius = 10
        cell.lblAuther.text = model[indexPath.row].Author
        cell.lblId.text = "\(model[indexPath.row].Id ?? "")"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
