//
//  ViewController.swift
//  Notes
//
//  Created by Юрий Филатов on 19.08.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let tabelView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabelView)
        tabelView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tabelView.delegate = self
        tabelView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabelView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Cell tapped")
    }
}

