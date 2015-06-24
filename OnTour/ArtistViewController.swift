//
//  ArtistViewController.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/23/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import UIKit
import MapKit

class ArtistViewController: UIViewController {
    
    @IBOutlet weak var badgeView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var similarArtistsLabel: UILabel!
    @IBOutlet weak var tourMapView: MKMapView!
    @IBOutlet weak var mapLabel: UILabel!
    
    var artist: Artist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfoForArtist(artist)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInfoForArtist(maybeArtist: Artist?) {
        guard let artist = maybeArtist else {
            return
        }
        
        self.badgeView.hidden = !artist.onTour
        self.nameLabel.text = artist.name
        loadImage(artist)
        loadSimilarArtists(artist)
        
        self.tourMapView.hidden = !artist.onTour
        loadGigs(artist)
    }
}

extension ArtistViewController {
    
    func loadImage(artist: Artist) {
        Songkicker.image(artist) { image in self.imageView.image = image }
    }
    
    func loadSimilarArtists(artist: Artist) {
        
        self.similarArtistsLabel.text = "Searching for similar artists..."
        
        Songkicker.similar(artist) { result in
            switch result {
            case .Failure(_): self.similarArtistsLabel.text = "Can't find similar artists"
                
            case .Success(let artists):
                let names = artists.take(5).map { $0.name }
                self.similarArtistsLabel.text = "For fans of : " + ", ".join(names)
            }
        }
    }
    
    func loadGigs(artist: Artist) {
        
        guard artist.onTour else {
            mapLabel.text = "Currently Not Gigging";
            mapLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
            mapLabel.shadowColor = UIColor.clearColor()
            return
        }
        
        
        
        
    }

}
