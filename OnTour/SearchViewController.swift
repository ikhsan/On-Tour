
import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let cellIdentifier = "ArtistCellIdentifier"
    let segueIdentifier = "SearchToDetail"
    
    var artists = [Artist]() {
        didSet {
            collectionView.reloadSections(NSIndexSet(index: 0))
            
            let showList = artists.count > 0
            collectionView.hidden = !showList
            instructionLabel.hidden = showList
        }
    }
    var loading = false {
        didSet {
            loading ? indicator.startAnimating() : indicator.stopAnimating()
            collectionView.hidden = loading
        }
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.becomeFirstResponder()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .Done, target: nil, action: nil)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == segueIdentifier) {
            
            guard let artistVC = segue.destinationViewController as? ArtistViewController else {
                return
            }            
            guard let ip = collectionView.indexPathsForSelectedItems()?.first else {
                return
            }
            
            let artist = artists[ip.item]
            artistVC.artist = artist
        }
    }
    
    // MARK: - Actions
    
    func searchArtistName(name: String) {
        
        loading = true
        Songkicker.searchArtist(name) { result in
            self.loading = false
            
            switch result {
            case .Failure(let error):
                self.artists = []
                self.showError(error)
                
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
        case .ParsingDataError:
            title = "Parsing Data Error"
            message = "Cannot parse data"
        case .EmptySetError:
            title = "Empty Set"
            message = "No results found 😐"
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


