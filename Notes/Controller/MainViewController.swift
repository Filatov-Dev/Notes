//
//  MainViewController.swift
//  Notes
//
//  Created by Юрий Филатов on 05.09.2023.
//

import UIKit

class MainViewController: UIViewController{
    
    var tabelView          = UITableView()
    var notes: [NoteModel] = []
    
    struct Cell {
        static let noteCell = "NoteCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        notes = enrichData()
        configureTabelView()
    }
    
    func configureTabelView() {
        view.addSubview(tabelView)
        setTabelViewDelegates()
        tabelView.rowHeight = 90
        tabelView.register(NoteCell.self, forCellReuseIdentifier: Cell.noteCell)
        tabelView.pin(to: view)
    }
    
    func setTabelViewDelegates() {
        tabelView.delegate = self
        tabelView.dataSource = self
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.identifier, for: indexPath) as? NoteCell else {
            fatalError("The tabelview is broken")
        }
        let note = self.notes[indexPath.row]
        cell.setData(note: note)
        
        return cell
    }
    
    
}

extension MainViewController {
    
    func enrichData() -> [NoteModel] {
        let note1 = NoteModel(image: UIImage(named: "razrabotka_11")!, title: "First note", description: "My firs note")
        let note2 = NoteModel(image: UIImage(named: "razrabotka_11")!, title: "Second note", description: "My second note")
        let note3 = NoteModel(image: UIImage(named: "razrabotka_11")!, title: "Third note", description: "My third note")
        
        return [note1, note2, note3]
    }
}
