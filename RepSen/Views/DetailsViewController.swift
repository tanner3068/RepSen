//
//  DetailsViewController.swift
//  RepSen
//
//  Created by John Tanner on 10/12/15.
//  Copyright © 2015 John Tanner. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var repOfDetailView : Reps?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var partyLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var districtLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var officeLabel: UILabel!
    
    @IBOutlet weak var linkLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let repOfDetailView = repOfDetailView {
            self.nameLabel.text = repOfDetailView.name
            self.partyLabel.text = repOfDetailView.party
            self.stateLabel.text = repOfDetailView.state
            self.districtLabel.text = repOfDetailView.district
            self.phoneLabel.text = repOfDetailView.phone
            self.officeLabel.text = repOfDetailView.office
            self.linkLabel.text = repOfDetailView.link
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
