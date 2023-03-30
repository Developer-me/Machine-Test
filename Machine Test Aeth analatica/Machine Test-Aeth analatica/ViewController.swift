//
//  ViewController.swift
//  Machine Test-Aeth analatica
//
//  Created by WC on 28/03/23.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var imgUsername: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var btnSignup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewMain.layer.cornerRadius = 20
        btnSignup.layer.cornerRadius = 10
        btnSignup.layer.borderWidth = 1
        btnSignup.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        txtUsername.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            
            
        )
        
        txtPassword.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            
        )
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SignUp(_ sender: UIButton) {
        if txtUsername.text != "" && txtPassword.text != "" {
            
            DataModel.datamodel.openDatabse(username: txtUsername.text ?? "", password: txtPassword.text ?? "")
        }
        
        
        
    }
              }





