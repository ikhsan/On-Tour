
import UIKit
import MapKit
import JPSThumbnailAnnotation

extension ArtistViewController {
    
    // MARK: - Map Actions
    
    func loadGigs(gigs: [Gig]) {
        let venues = gigs.map { gig -> JPSThumbnailAnnotation in
            let thumbnail = JPSThumbnail()
            thumbnail.title = gig.venue
            thumbnail.subtitle = gig.name
            
            if let coordinate = gig.coordinate {
                thumbnail.coordinate = coordinate
            }
            if let date = gig.date {
                thumbnail.image = CalendarThumbnail.forDate(date)
            }
            
            thumbnail.disclosureBlock = { self.openGig(gig) }
            
            return JPSThumbnailAnnotation(thumbnail: thumbnail)
        }
        
        tourMapView.addAnnotations(venues)
        
        if let firstVenue = venues.first {
            showRegion(firstVenue)
        }
    }
    
    func showRegion(venue: JPSThumbnailAnnotation) {
        let d : Double = 800000
        let region = tourMapView.regionThatFits(MKCoordinateRegionMakeWithDistance(venue.coordinate, d, d))
        tourMapView.setRegion(region, animated: true)
    }
    
}

extension ArtistViewController: MKMapViewDelegate {
    
    // MARK: - Map View Delegate
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        if let annotation = view as? JPSThumbnailAnnotationViewProtocol {
            annotation.didSelectAnnotationViewInMap(mapView)
        }
    }
    
    func mapView(mapView: MKMapView, didDeselectAnnotationView view: MKAnnotationView) {
        if let annotation = view as? JPSThumbnailAnnotationViewProtocol {
            annotation.didDeselectAnnotationViewInMap(mapView)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let a = annotation as? JPSThumbnailAnnotationProtocol {
            return a.annotationViewInMap(mapView)
        }
        return nil
    }
    
}
