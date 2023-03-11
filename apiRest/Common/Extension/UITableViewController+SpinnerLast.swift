//
//  UITableViewController+SpinnerLast.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

import UIKit

extension UITableViewController {
    func addSpinnerLastCell() {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.frame = CGRect(
            x: .zero,
            y: .zero,
            width: tableView.bounds.width,
            height: CGFloat(
                ViewValues.defaultHeightCell))
        tableView.tableFooterView = spinner
    }
}
