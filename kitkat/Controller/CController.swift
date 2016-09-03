import UIKit

class CController:UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge.None
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.Default
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
}