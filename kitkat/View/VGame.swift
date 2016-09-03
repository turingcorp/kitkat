import UIKit

class VGame:UIView
{
    weak var controller:CGame!
    
    convenience init(controller:CGame)
    {
        self.init()
        backgroundColor = UIColor.redColor()
        self.controller = controller
    }
}