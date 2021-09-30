//
//  TableDataSource.swift
//  PromosTestTask
//
//


import Foundation
import UIKit

import Foundation
import UIKit

class UserTableViewDataSource<C : UITableViewCell,T> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    var items : [T] = []
    var configureCell : (C, T) -> () = {_,_ in }
    
    init(cellIdentifier : String, configureCell : @escaping (C, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! C
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
    
}
