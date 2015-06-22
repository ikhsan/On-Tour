//
//  ArtistCell.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/21/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import UIKit

class ArtistCell: UICollectionViewCell {
    
    @IBOutlet weak var onTourBadgeView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override var highlighted: Bool {
        didSet {
            self.backgroundColor = self.highlighted ? UIColor.songkickBlue.colorWithAlphaComponent(CGFloat(0.5)) : UIColor.whiteColor()
            self.nameLabel.textColor = self.highlighted ? UIColor.whiteColor() : UIColor.blackColor()
        }
    }

}
