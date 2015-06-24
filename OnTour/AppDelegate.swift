
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        configureSongkicker()
        customizeAppearance()
        return true
    }
    
    func configureSongkicker() {
        Songkicker.configureBase("http://api.songkick.com/api/3.0/", apikey: "jhevSy2yQF6HFzmb")
    }
    
    func customizeAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.songkickBlue
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(descriptor: UIFontDescriptor(name: "Avenir-Heavy", size: CGFloat(18)), size: CGFloat(18)),
            NSForegroundColorAttributeName: UIColor.whiteColor(),
        ]
        
        let attributes = [
            NSFontAttributeName: UIFont(descriptor: UIFontDescriptor(name: "Avenir-Book", size: CGFloat(14)), size: CGFloat(14)),
            NSForegroundColorAttributeName: UIColor.songkickBlue,
        ]
        UIBarButtonItem.sk_appearanceWhenContainedIn(UISearchBar.self).setTitleTextAttributes(attributes, forState: .Normal)
        UITextField.sk_appearanceWhenContainedIn(UISearchBar.self).defaultTextAttributes = [
            NSFontAttributeName: UIFont(descriptor: UIFontDescriptor(name: "Avenir-Book", size: CGFloat(14)), size: CGFloat(14)),
        ]
    }

}

