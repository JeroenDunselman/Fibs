//
//  FibRequest.swift
//  Fibs
//
//  Created by Jeroen Dunselman on 11/05/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import Foundation
import UIKit

class FibRequest : NSObject {

  var row: Int?
  var fibValue: Int?
  
  init(row: Int) {
    self.row = row
  }
  
  func calculate(row: Int, textView:UILabel) {
    
    DispatchQueue.global(qos: .background).async {
      
      func fibs(n: Int) -> Int {
        
        if n == 0 {
          return 0
        } else if n == 1{
          return 1
        }
        
        return fibs(n: n - 1) + fibs(n: n - 2)
      }
      
      let result:Int = fibs(n: row)
      
      self.fibValue = result
      DispatchQueue.main.async {
        () -> Void in
        textView.text = String(result)
      }
      
    }
  }

}
