//
//  NoteCell.swift
//  Notes
//
//  Created by Юрий Филатов on 05.09.2023.
//

import UIKit

class NoteCell: UITableViewCell {
    
    static let identifier = "NoteCell"
    
    private let noteImageView: UIImageView  = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        
        return iv
    }()
    
    private let noteTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "Error"
        
        return label
    }()
    private let noteDescription: UITextView = {
        let description = UITextView()
        description.text = "Error"
        description.textAlignment = .left
        description.font = .systemFont(ofSize: 24, weight: .medium)
        
        return description
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        self.contentView.addSubview(noteImageView)
        self.contentView.addSubview(noteTitleLabel)
        self.contentView.addSubview(noteDescription)
     
        setConstraints()
    }
    
    public func setData(note: NoteModel) {
        noteImageView.image  = note.image
        noteTitleLabel.text = note.title
        noteDescription.text = note.description
    }
    
    private func setConstraints() {
        noteImageView.translatesAutoresizingMaskIntoConstraints = false
        noteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        noteDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noteImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            noteImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            noteImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            noteImageView.widthAnchor.constraint(equalToConstant: 85),
            noteImageView.heightAnchor.constraint(equalToConstant: 85),
            
            noteTitleLabel.leadingAnchor.constraint(equalTo: self.noteImageView.trailingAnchor, constant: 16),
            noteTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            noteTitleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            noteTitleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
    }
}
