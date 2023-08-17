//
//  CharacterDescriptionTableCell.swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 17/08/2023.
//

import UIKit

protocol CharacterDescriptionTableCellProtocol: AnyObject {
    var characterDescription: String { get set }
}

class CharacterDescriptionTableCell: UITableViewCell, CharacterDescriptionTableCellProtocol {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var characterDescription: String = "" {
        didSet {
            descriptionLabel.text = characterDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
}
