//
//  ItemTableViewCell.swift
//  SephoraDemo
//
//  Created by Aladdin HOUAS on 06/01/2024.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    var item : StoreItem? 
    {
        didSet {
            itemTitleLabel.text = item?.product_name
            itemDescriptionLabel.text = item?.description
            itemPriceLabel.text = "\(item?.price ?? 0)"
            itemImage.downloaded(from: item?.images_url?.small ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
