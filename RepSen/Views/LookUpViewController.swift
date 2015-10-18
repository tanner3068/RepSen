//
//  LookUpViewController.swift
//  RepSen
//
//  Created by John Tanner on 10/12/15.
//  Copyright © 2015 John Tanner. All rights reserved.
//

import UIKit



var repSegue = "repSegue"
var resultsForReps : [Reps] = []


class LookUpViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var repSegue = "repSegue"
    var repArrayLookUP : [Reps] = []
    
    var states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        APIController.searchRepByState("UT") { (representative) in
            
           print("made it to print ( A reps)")
            print(representative)
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
    
//    
    @IBAction func repLookupButtonPressed(sender: AnyObject) {
//
        let index = self.pickerView.selectedRowInComponent(0)
        let stateString = self.states[index]
        
        APIController.searchRepByState(stateString) { (representative) in
            if representative.count > 0 {
                
              self.repArrayLookUP = representative
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("repSegue", sender: sender)
            })
            
        
            }else {
                
            print ("There was an error searching for reps")

    }
}
}
 // Mark: Navigation  PREPARE FOR  SEGUE
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "repSegue" {
            
            let resultsView = segue.destinationViewController as! ResultsViewController
            resultsView.repArrayResults = self.repArrayLookUP
            
        }
    }
}





extension LookUpViewController: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
}

extension LookUpViewController: UIPickerViewDelegate {
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //        print("\(states[row])")
        return states[row]
        
        
    }
}