//
//  CellEvent.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 13/09/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import Foundation
import UIKit

class CellEvent: UITableViewCell{
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var nameEventLabel: UILabel!
    @IBOutlet weak var categorieLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
}
