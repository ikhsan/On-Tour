//
//  ViewController.swift
//  OnTour
//
//  Created by Ikhsan Assaat on 6/20/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let cellIdentifier = "ArtistCellIdentifier"
    
    var artists = [Artist]() {
        didSet {
            collectionView.reloadSections(NSIndexSet(index: 0))
            instructionLabel.hidden = artists.count > 0
        }
    }
    var loading = false {
        didSet {
            loading ? indicator.startAnimating() : indicator.stopAnimating()
            collectionView.hidden = loading
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.becomeFirstResponder()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func searchArtistName(name: String, page: Int = 1) {
        
        loading = true
        Songkicker.searchArtist(name, page: page) { result in
            self.loading = false
            
            switch result {
            case .Failure(let error): self.showError(error)
                
            case .Success(let artists):
                self.artists = artists
            }
        }
    }
    
    func showError(error: SongkickerError) {
        
        var title: String
        var message: String

        switch error {
        case .ConfigurationError:
            title = "API not configured"
            message = "Please use configure with your API key"
        case .NetworkError:
            title = "Network Error"
            message = "Connection is currently unavailable/faulty"
        case .ParsingError(let errorMessage):
            title = "Parsing Error"
            message = errorMessage
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let dismissAction = UIAlertAction(title: "Bummer :(", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(dismissAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}


