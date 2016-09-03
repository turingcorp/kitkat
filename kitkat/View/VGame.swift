import UIKit

class VGame:UIView
{
    weak var controller:CGame!
    weak var racket:VGameRacket!
    
    convenience init(controller:CGame)
    {
        self.init()
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        userInteractionEnabled = false
        self.controller = controller
    }
    
    override func touchesBegan(touches:Set<UITouch>, withEvent event:UIEvent?)
    {
        
    }
    
    override func touchesMoved(touches:Set<UITouch>, withEvent event:UIEvent?)
    {
        
    }
    
    //MARKK: public
    
    func load()
    {
        self.racket = VGameRacket(controller:controller)
        userInteractionEnabled = true
    }
}