//
//  DetailsViewController.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 02/10/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var currentEvent: Event?
    var currentUser: User?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categorieLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var heureLabel: UILabel!
    @IBOutlet weak var tarifsLabel: UILabel!
    @IBOutlet weak var placesLabel: UILabel!
    
    
    @IBAction func bookButtonPressed(_ sender: Any) {
        if (currentUser == nil){
            // utilisateur non existant , rediriger vers login et inscription
            performSegue(withIdentifier: "showLogin", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.timeZone = TimeZone(identifier: "CET")
        let tarifs = currentEvent!.tarifs
        nameLabel.text = currentEvent!.nom
        categorieLabel.text = "<\(String(describing: currentEvent!.categorie))>"
        descriptionTextView.text = currentEvent!.description
        dateLabel.text = "Date : \(dateFormatter.string(from: (currentEvent!.date)))"
        heureLabel.text = "Heure : \(timeFormatter.string(from: (currentEvent!.date)))"
        tarifsLabel.text = "Prix : \(tarifs[0]) € enfant  \(tarifs[1]) € adultes"
        placesLabel.text = "Places : \(String(describing: currentEvent!.places)) capacité maximale"
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
