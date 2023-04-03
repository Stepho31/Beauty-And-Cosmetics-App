//
//  ProductsListTableViewCell.swift
//  HairStylist
//
//  Created by Stephen Byron on 2/26/23.
//

import UIKit

class ProductsListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
