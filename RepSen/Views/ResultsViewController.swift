//
//  ResultsViewController.swift
//  RepSen
//
//  Created by John Tanner on 10/12/15.
//  Copyright © 2015 John Tanner. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var repArrayResults: [Reps] = []
    var repObject: Reps?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detailSegue" {
        
                let cell = sender as! UITableViewCell
                let indexPath = self.tableView.indexPathForCell(cell)
                let rep = self.repArrayResults[indexPath!.row]
                let detailViewController = segue.destinationViewController as! DetailsViewController
                
                detailViewController.repOfDetailView = rep
                
        }
        
           
//            detailView.repOfDetailView = repObject
            
            
        
        
    }

}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repArrayResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)
        
        let rep = self.repArrayResults[indexPath.row]
        print(" This is the indexPath.row \(indexPath.row)")
        let name = rep.name, party = rep.party
        
            cell.detailTextLabel?.text = party
                cell.textLabel?.text = name
            return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         self.repObject = repArrayResults[indexPath.row]
    }
    
    
    

}