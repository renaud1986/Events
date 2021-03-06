//
//  InscriptionViewController.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 02/10/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import UIKit
import Firebase

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
    var newUser: User!
    
    @IBAction func resetChanges(_ sender: UIButton) {
        nomUser.text = ""
        prenomUser.text = ""
        datePicker.reloadInputViews()
        emailUser.text = ""
        passwordUser.text = ""
        adresseUser.text = ""
        numeroUser.text = ""
        cpUser.text = ""
        localiteUser.text = ""
    }
    
    @IBAction func confirmChanges(_ sender: UIButton) {
        guard !((nomUser.text?.isEmpty)!) else{
            return showToast(message: "Il manque le nom !")
        }
        
        guard !((prenomUser.text?.isEmpty)!) else{
            return showToast(message: "Il manque le prenom !")
        }
        
        guard !((emailUser.text?.isEmpty)!) else{
            return showToast(message: "Il manque l'email !")
        }
        
        guard !((passwordUser.text?.isEmpty)!) else{
            return showToast(message: "Il manque le mot de passe !")
        }
        
        guard !((adresseUser.text?.isEmpty)!) else{
            return showToast(message: "Il manque la rue !")
        }
        
        guard !((numeroUser.text?.isEmpty)!) else{
            return showToast(message: "Il manque le numero !")
        }
        
        guard !((cpUser.text?.isEmpty)!) else{
            return showToast(message: "Il manque le code postal !")
        }
        
        guard !((localiteUser.text?.isEmpty)!) else{
            return showToast(message: "Il manque la localite !")
        }
        
        createInscription()
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
    
    func createInscription(){
        let nom = nomUser.text!
        let prenom = prenomUser.text!
        let date = datePicker.date
        let dateConverted = DateFormatter().string(from: date)
        let rue = adresseUser.text!
        let num = numeroUser.text!
        let cp = cpUser.text!
        let localite = localiteUser.text!
        let adresse = Adresse(rue: rue, numero: num, cp: Int(cp)!, localite: localite)

        // creation de l'user
        Auth.auth().createUser(withEmail: emailUser.text!, password: passwordUser.text!){ (user, error) in
            if error == nil {
                
                let newProfile = Profile(idProfile: 1, nom: nom, prenom: prenom, ddn: date, adresse: adresse, refUser: 1)
                let email = self.emailUser.text!
                let mdp = self.passwordUser.text!
                self.newUser = User(email: email, password: mdp, idProfile: newProfile.idProfile, events: [])
                // inserer ici en base de donnees
                var ref: DatabaseReference!
                ref = Database.database().reference()
                let userId = Auth.auth().currentUser?.uid
                ref.child("users").child(userId!).child("email").setValue(email)
                ref.child("users").child(userId!).child("mdp").setValue(mdp)
                ref.child("users").child(userId!).child("nom").setValue(nom)
                ref.child("users").child(userId!).child("prenom").setValue(prenom)
                ref.child("users").child(userId!).child("ddn").setValue(dateConverted)
                ref.child("users").child(userId!).child("adresse").child("rue").setValue(rue)
                ref.child("users").child(userId!).child("adresse").child("numero").setValue(num)
                ref.child("users").child(userId!).child("adresse").child("cp").setValue(cp)
                ref.child("users").child(userId!).child("adresse").child("localite").setValue(localite)
                self.showToast(message: "Inscription terminee !")
            }
            else{
                let alertController = UIAlertController(title: "Utilisateur deja existant !", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }

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
