//
//  LoginViewController.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 02/10/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var currentUser: User?
    @IBOutlet weak var emailChecking: UITextField!
    @IBOutlet weak var passwordChecking: UITextField!
    
    @IBAction func connexionPressed(_ sender: UIButton) {
    }
    
    @IBAction func notInPressed(_ sender: UIButton) {
    }
    
    @IBAction func forgotMdpPressed(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
