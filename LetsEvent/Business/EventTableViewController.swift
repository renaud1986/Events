//
//  EventTableTableViewController.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 12/09/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    var events:[Event] = [Event(idEvent: 1,nom : "Lets Talk !",
                                categorie: .Debats,
                                description: "Discussion sur le sida autour d'un verre",
                                date: Date(),
                                heure: "18h00",
                                adresse: Adresse(rue: "rue des potirons",numero: "15",cp: 1150,localite:"Auderghem"),
                                places: 300,
                                tarifs: [8.0,15.0,10.0]),
                          Event(idEvent: 2,nom : "Futuroscope",
                                categorie: .Technologies,description: "Visite des differentes technologies de demain",
                                date: Date(),
                                heure: "19h00",
                                adresse: Adresse(rue: "avenue des levriers",numero: "200A",cp: 1020,localite: "Schaerbeek"),
                                places: 3000,
                                tarifs: [12.0,18.0,13.0]),
                          Event(idEvent: 3,nom: "Lets Party all Night",
                                categorie: .Musique,
                                description: "We will dance all the night and have some hot guest and a special DJ tonight !",
                                date: Date(),
                                heure: "22h",
                                adresse: Adresse(rue: "chaussee aux moines",numero: "120B",cp: 1050,localite: "Ixelles"),
                                places: 200,
                                tarifs: [0.0,12.0,8.0])]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"EventCellIdentifier") as? CellEvent else{
            fatalError("Did not worked..")
        }
        var entry = events[indexPath.row]
        
        cell.nameEventLabel.text = entry.nom
        cell.categorieLabel.text = "<\(entry.categorie)>"
        cell.descriptionTextView.text = entry.description
        let actualDate = entry.date
        //let components = NSCalendar.current.dateComponents([.day, .month, .year,.hour], from: actualDate)
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.timeZone = TimeZone(identifier: "CET")
        //timeFormatter.timeZone = TimeZone.current a utiliser pour suivre l'appareil de l'utilisateur
        
        cell.dateTimeLabel.text = dateFormatter.string(from: actualDate)
        cell.timeLabel.text = timeFormatter.string(from: actualDate)
        cell.priceLabel.text = "Prix : \(entry.tarifs[0]) € e. \(entry.tarifs[1]) € a."
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "showDetails"){
         let detailsViewController = segue.destination as! DetailsViewController
         let indexPath = tableView.indexPathForSelectedRow!
         let selectedEvent = events[indexPath.row]
         detailsViewController.currentEvent = selectedEvent
        }
    }
}
