//
//  TechViewController.swift
//  TechDemo
//
//  Created by SachchidaNand Mishra on 18/07/20.
//  Copyright © 2020 Sachchida Nand Mishra. All rights reserved.
//

import UIKit

class TechViewController: UIViewController {
    let listTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TechTableViewCell.self, forCellReuseIdentifier: TableViewModel.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshData))
        //
        view.backgroundColor = .white
        view.addSubview(listTableView)
        listTableView.delegate = TableViewModel.instance
        listTableView.dataSource = TableViewModel.instance
        listTableView.tableFooterView = UIView()
        setupTableViewLayout()
        refreshData()
    }
    
    @objc private func refreshData() {
        ProgressView.shared.showLoader(for: self)
        DataModel.getData(from: Constants().dataURL, success: {response in
            DispatchQueue.main.async {
                [unowned self] in
                self.title = response.responseTitle
                self.listTableView.reloadData()
                ProgressView.shared.dismissLoader()
            }
        }, failure: {
            ProgressView.shared.dismissLoader()
        })
    }
    
    private func setupTableViewLayout() {
        listTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    deinit {
        print("\(self) is being deinitialized")
    }

}
