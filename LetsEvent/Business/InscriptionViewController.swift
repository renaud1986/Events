//
//  InscriptionViewController.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 02/10/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import UIKit

class InscriptionViewController: UIViewController {

    @IBOutlet weak var nomUser: UITextField!
    @IBOutlet weak var prenomUser: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var emailUser: UITextField!
    @IBOutlet weak var passwordUser: UITextField!
    @IBOutlet weak var adresseUser: UITextField!
    @IBOutlet weak var numeroUser: UITextField!
    @IBOutlet weak var cpUser: UITextField!
    @IBOutlet weak var localiteUser: UITextField!
    
    @IBAction func resetChanges(_ sender: UIButton) {
    }
    
    @IBAction func confirmChanges(_ sender: UIButton) {
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
