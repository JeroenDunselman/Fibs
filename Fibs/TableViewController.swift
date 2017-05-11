//
//  TableViewController.swift
//  Fibs
//
//  Created by Jeroen Dunselman on 11/05/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  var service:FibService?
  var numRows:Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    service = FibService(vc: self)
    numRows = service?.maxVals
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numRows!
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,
                           reuseIdentifier: "Cell")
    
    cell.detailTextLabel?.text = String(indexPath.row)
    cell.textLabel?.text = "Calculating..."
    
    //find calculationrequest for row, or create one
    if let fibRequest:FibRequest = self.service?.findRequestFor(row: indexPath.row) {
      
      if let fibResult:Int = fibRequest.fibValue {
        cell.textLabel?.text = "\(fibResult)"
      }
    } else {
      self.service?.fibRequest(row: indexPath.row, textView: cell.textLabel!)
    }
    return cell
  }
}

  

