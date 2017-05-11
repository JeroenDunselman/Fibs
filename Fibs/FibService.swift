//
//  FibService.swift
//  Fibs
//
//  Created by Jeroen Dunselman on 11/05/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import Foundation
import UIKit
class FibService: NSObject {
  
  var client: TableViewController?
  var fibValues:[Int] = []
  var fibs:[Int:Int] = [:]
  var fibRequests:[FibRequest] = []
  //trial&error shows 93 is the max index without fibvalue surpassing MAX_LONG
  public let maxVals:Int = 93
  
  init(vc: TableViewController) {
    super.init()
    client = vc
  }
  
  func findRequestFor(row: Int) -> FibRequest?{
    let optionalRequests: [FibRequest]? = fibRequests
    let requests = optionalRequests ?? []
    
    let rowRequest = requests
      .filter{($0.row == row)}

    if !rowRequest.isEmpty {
      return rowRequest.first 
    }
    
    return nil
  }

  func fibRequest(row: Int, textView: UILabel) {
    let request:FibRequest = FibRequest(row: row)
    fibRequests.append(request)
    request.calculate(row: row, textView: textView)
  }
}


