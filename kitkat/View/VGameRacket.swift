import UIKit

class VGameRacket:UIView
{
    weak var controller:CGame!
    private let kCornerRadius:CGFloat = 4
    
    convenience init(controller:CGame)
    {
        self.init()
        userInteractionEnabled = false
        backgroundColor = UIColor.blueColor()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = kCornerRadius
        self.controller = controller
    }
}