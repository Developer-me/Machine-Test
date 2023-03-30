//
//  LoginPageVC.swift
//  Machine Test-Aeth analatica
//
//  Created by WC on 28/03/23.
//

import UIKit

class LoginPageVC: UIViewController {
    
    let model = DataModel()
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var imgUsername: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var btnSigninOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        MainView.layer.cornerRadius = 20
        btnSigninOut.layer.cornerRadius = 10
        btnSigninOut.layer.borderWidth = 1
        btnSigninOut.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        txtUsername.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        txtPassword.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        imgPassword.image = UIImage(named: "hide")
        txtPassword.isSecureTextEntry = true
    }
    override func viewWillAppear(_ animated: Bool) {
        txtPassword.text = ""
    }
    @IBAction func btnPasswordhide(_ sender: UIButton) {
        
        if imgPassword.image == UIImage(named: "show") {
            imgPassword.image = UIImage(named: "hide")
            txtPassword.isSecureTextEntry = true
        }else{
            imgPassword.image = UIImage(named: "show")
            txtPassword.isSecureTextEntry = false
        }
        
    }
    
    
    
    
    
    
    
    
    @IBAction func txtActValidation(_ sender: UITextField) {
        let user = DataModel.datamodel.userdata.contains(where: {
            $0.username == sender.text
        })
        print(sender.text)
        if user {
            imgUsername.image = UIImage(named: "ok")
        }else{
            imgUsername.image = UIImage(named: "")
        }
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        let pass = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(pass, animated: true)
        
        
    }
    
    @IBAction func btnSignin(_ sender: UIButton) {
        
        
        
        DataModel.datamodel.fetch()
        
        let user = DataModel.datamodel.userdata.contains(where: {
            $0.username == txtUsername.text  && $0.password == txtPassword.text
        })
        
        if user {
            let pass = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageVC") as! HomePageVC
            self.navigationController?.pushViewController(pass, animated: true)
        }
        
    }
}
