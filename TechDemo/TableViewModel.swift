//
//  TableViewModel.swift
//  TechDemo
//
//  Created by SachchidaNand Mishra on 19/07/20.
//  Copyright © 2020 Sachchida Nand Mishra. All rights reserved.
//

import Foundation
import UIKit


class TableViewModel: NSObject {
    static let instance = TableViewModel()
    static let cellIdentifier = "CustomCellIdentifier"
}

extension TableViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rows = DataModel.instance.responseResultData?.responseDataResults.count {
            return rows
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: TableViewModel.cellIdentifier, for: indexPath) as? TechTableViewCell
        if cell == nil {
            cell = TechTableViewCell(style: .default, reuseIdentifier: TableViewModel.cellIdentifier)
        }
        
        let responseResult = DataModel.instance.responseResultData?.responseDataResults[indexPath.row]
        cell?.configure(from: responseResult!)
        
        return cell!
    }
}

//

extension TableViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
