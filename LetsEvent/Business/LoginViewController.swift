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
    var nbEssais = 0
    @IBOutlet weak var emailChecking: UITextField!
    @IBOutlet weak var passwordChecking: UITextField!
    
    @IBAction func connexionPressed(_ sender: UIButton) {
        
        guard nbEssais < 3 else{
            return goToInscription()
        }
        
        guard !(emailChecking.text?.isEmpty)!else{
            guard !(passwordChecking.text?.isEmpty)! else{
               nbEssais = nbEssais + 1
               return showToast(message: "Les 2 champs sont vides !")
            }
               nbEssais = nbEssais + 1
               return showToast(message: "L'email n'est pas rempli!")
        }
        
        guard  !(passwordChecking.text?.isEmpty)! else{
            nbEssais = nbEssais + 1;
            return showToast(message: "Le mot de passe n'est pas rempli!")
        }
        
        // si l'utilisateur est cree on retourne aux details
        guard currentUser == nil else{
            return goBackToDetails()
        }
        
        // interroger ici la db sur firebase pour checker les 2 champs
        
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
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 7.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func goToInscription(){
        performSegue(withIdentifier: "toInscription", sender: nil)
    }

    func goBackToDetails(){
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindFromInscription(_ sender:UIStoryboardSegue){
        if let sender = sender.source as? InscriptionViewController{
            currentUser = sender.newUser
            emailChecking.text = currentUser?.email
            passwordChecking.text = currentUser?.password
        }
    }

}
