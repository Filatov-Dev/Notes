//
//  NoteCell.swift
//  Notes
//
//  Created by Юрий Филатов on 05.09.2023.
//

import UIKit

class NoteCell: UITableViewCell {
    
    var noteImageView  = UIImageView()
    var noteTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(noteImageView)
        addSubview(noteTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(note: NoteModel) {
        noteImageView  = note.image
        noteTitleLabel = note.title
    }
    
    func configureImageView() {
        noteImageView.layer.cornerRadius = 10
        noteImageView.clipsToBounds      = true
    }
    
    func configureTitleLabel() {
        noteTitleLabel.numberOfLines             = 0
        noteTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        noteImageView.translatesAutoresizingMaskIntoConstraints                                                = false
        noteImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                = true
        noteImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive                  = true
        noteImageView.heightAnchor.constraint(equalToConstant: 30).isActive                                    = true
        noteImageView.widthAnchor.constraint(equalTo: noteImageView.heightAnchor, multiplier: 16/9).isActive   = true
    }
    
    func setTitleConstraints() {
        noteTitleLabel.translatesAutoresizingMaskIntoConstraints                                               = false
        noteTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                               = true
        noteTitleLabel.leadingAnchor.constraint(equalTo: noteImageView.trailingAnchor, constant: 20).isActive  = true
        noteTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive                                   = true
        noteTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive              = true
    }
}
