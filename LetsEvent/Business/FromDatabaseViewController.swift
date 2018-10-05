//
//  FromDatabaseViewController.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 05/10/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import UIKit
import Firebase

class FromDatabaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        readDatas()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readDatas(){
      if let user = Auth.auth().currentUser {
    
        let ref = Database.database().reference()
        let uId = Auth.auth().currentUser?.uid
        
        ref.child("users").child(uId!).observeSingleEvent(of: .value){
            (datas) in
            let value = datas.value as? NSDictionary  // recupere le conteneur
            // ici les differentes valeurs recuperables
            //let username = value?["username"] as? String ?? "guest"
        }
    
     }
     else{
        fatalError("Aucun utilisateur connecté ici !")
     }
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
