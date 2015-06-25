
import UIKit
import MapKit

class ArtistViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var badgeView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var similarArtistsLabel: UILabel!
    @IBOutlet weak var tourMapView: MKMapView!
    @IBOutlet weak var mapLabel: UILabel!
    
    var artist: Artist?
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInfoForArtist(artist)
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let actionButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "openArtist")
        navigationItem.rightBarButtonItem = actionButton
        
        let icon = UIImageView(image: UIImage(named: "ampli-icon"))
        icon.contentMode = .ScaleAspectFit
        icon.frame.size = CGSize(width: 30, height: 30)
        navigationItem.titleView = icon
    }
    
    func loadInfoForArtist(maybeArtist: Artist?) {
        guard let artist = maybeArtist else {
            return
        }
        
        self.badgeView.hidden = !artist.onTour
        self.nameLabel.text = artist.name
        getImage(artist)
        getSimilarArtists(artist)
        
        self.tourMapView.hidden = !artist.onTour
        getGigs(artist)
    }
}

extension ArtistViewController {
    
    // MARK: - Songkicker API
    
    func getImage(artist: Artist) {
        Songkicker.image(artist) { image in self.imageView.image = image }
    }
    
    func getSimilarArtists(artist: Artist) {
        
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
    
    func getGigs(artist: Artist) {
        
        guard artist.onTour else {
            mapLabel.text = "Currently Not Gigging";
            mapLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
            mapLabel.shadowColor = UIColor.clearColor()
            return
        }
        
        mapLabel.text = "Loading gigs..."
        
        Songkicker.gigs(artist, page: 1) { result -> Void in
            switch result {
            case .Failure(_): self.mapLabel.text = "Gigs not found :("
            case .Success(let gigs):
                self.mapLabel.text = "Tour Map"
                self.loadGigs(gigs)
            }
        }
    }

}

extension ArtistViewController {
    
    // MARK: - Actions
    
    func confirmOpenInSafari(message: String, ok: String, cancel: String, urlString: String) -> UIAlertController {
        let alert = UIAlertController(title: "Open in Safari?", message: message, preferredStyle: .Alert)
        
        let nope = UIAlertAction(title: cancel, style: .Cancel, handler: nil)
        alert.addAction(nope)
        
        let yep = UIAlertAction(title: ok, style: .Default) { _ in
            if let url = NSURL(string: urlString) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        alert.addAction(yep)
        
        return alert
    }
    
    func openArtist() {
        guard let a = artist else {
            return
        }
        
        openArtist(a)
    }
    
    func openArtist(artist: Artist) {
        let alert = confirmOpenInSafari(
            "Do you want to open \(artist.name)'s songkick profile?",
            ok: "Yep",
            cancel: "Nope",
            urlString: artist.uri
        )
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func openGig(gig: Gig) {
        let alert = confirmOpenInSafari(
            "Do you want to open \(gig.name)?",
            ok: "Sure",
            cancel: "Na ah",
            urlString: gig.uri
        )
        presentViewController(alert, animated: true, completion: nil)
    }
    
}