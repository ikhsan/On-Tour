
class CalendarThumbnail {
    
    private static var cache = [String: UIImage]()
    
    class func forDate(date: NSDate) -> UIImage {
        
        let formatter = NSDateFormatter()
        
        formatter.dateFormat = "dd"
        let day = formatter.stringFromDate(date)
        formatter.dateFormat = "MMM"
        let month = formatter.stringFromDate(date).uppercaseString
        
        return forDay(day: day, month: month)
    }
    
    private class func forDay(day day: String, month: String) -> UIImage {
        // load from cache
        let key = "\(day)_\(month)"
        if let cachedImage = cache[key] {
            return cachedImage
        }
        
        // image creation
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40.0, height: 40.0))
        view.backgroundColor = UIColor.songkickBlue
        
        let monthLabel = UILabel(frame: CGRect(x: 0.0, y: 5.0, width: CGRectGetWidth(view.bounds), height: 10.0))
        monthLabel.text = month
        monthLabel.textAlignment = .Center
        monthLabel.font = UIFont(name: "Avenir-Black", size: 10.0)
        monthLabel.textColor = UIColor.whiteColor()
        view.addSubview(monthLabel)
        
        let dayLabel = UILabel(frame: CGRect(x: 0.0, y: 15.0, width: CGRectGetWidth(view.bounds), height: 25.0))
        dayLabel.text = day
        dayLabel.textAlignment = .Center
        dayLabel.font = UIFont(name: "Avenir-Heavy", size: 22.0)
        dayLabel.textColor = UIColor.whiteColor()
        view.addSubview(dayLabel)
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0)
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // save to cache
        cache[key] = image
        
        return image
    }
}