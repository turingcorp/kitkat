import UIKit

class CParent:UIViewController
{
    private var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.Default
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        let news:CNews = CNews()
        pushController(news, transition:MMainTransition.Replace())
        MUser.sharedInstance.load()
        MGandaller.sharedInstance.load()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return statusBarStyle
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return false
    }
    
    //MARK: public
    
    func statusBarLight()
    {
        statusBarStyle = UIStatusBarStyle.LightContent
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func statusBarDefault()
    {
        statusBarStyle = UIStatusBarStyle.Default
        setNeedsStatusBarAppearanceUpdate()
    }
}