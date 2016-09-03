import UIKit

class VGameRacket:UIView
{
    weak var controller:CGame!
    weak var layoutRacketTop:NSLayoutConstraint!
    private let kCornerRadius:CGFloat = 4
    private let kWidth:CGFloat = 25
    private let kHeight:CGFloat = 100
    private let kLeft:CGFloat = 40
    
    convenience init(controller:CGame)
    {
        self.init()
        userInteractionEnabled = false
        backgroundColor = UIColor.blueColor()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = kCornerRadius
        self.controller = controller
        
        let parent:UIView = controller.view
        parent.addSubview(self)
        
        let views:[String:AnyObject] = [
            "racket":self]
        
        let metrics:[String:AnyObject] = [
            "racketLeft":kLeft,
            "racketWidth":kWidth,
            "racketHeight":kHeight]
        
        parent.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(racketLeft)-[racket(racketWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        parent.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[racket(racketHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        let height:CGFloat = UIScreen.mainScreen().bounds.maxY
        let remain:CGFloat = height - kHeight
        let margin:CGFloat = remain / 2.0
        
        layoutRacketTop = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:parent,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:margin)
        
        parent.addConstraint(layoutRacketTop)
    }
}