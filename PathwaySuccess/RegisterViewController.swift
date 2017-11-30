//
//  RegisterViewController.swift
//  PathwaySuccess
//
//  Created by Ngo, Billy K on 11/29/17.
//  Copyright © 2017 Ngo, Billy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var desiredEmail: UITextField!
    @IBOutlet weak var desiredPassword: UITextField!
    var alertController: UIAlertController? = nil
    
    @IBAction func registerButton(_ sender: Any) {
        print("registered button")
        if(desiredEmail.text == "" && desiredPassword.text == ""){
            print("Authenticated")
            Auth.auth().createUser(withEmail: (desiredEmail.text)!, password: (desiredPassword.text)!, completion: {(user, error) in
                if error != nil {
                    self.alertController = UIAlertController(title: "Incorrect Email or Password", message: "Make sure email comes with @ and password is more than 6 characters", preferredStyle: UIAlertControllerStyle.alert)
                    
                }
                else{
                    self.performSegue(withIdentifier: "toHomePage", sender: self)
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
