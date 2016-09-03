import UIKit

class VGameRacket:UIView
{
    weak var controller:CGame!
    weak var layoutRacketTop:NSLayoutConstraint!
    private let kCornerRadius:CGFloat = 4
    private let kWidth:CGFloat = 25
    private let kHeight:CGFloat = 100
    private let kLeft:CGFloat = 50
    private var height_2:CGFloat
    
    init(controller:CGame)
    {
        height_2 = kHeight / 2.0
        
        super.init(frame:CGRectZero)
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
        
        let midY:CGFloat = UIScreen.mainScreen().bounds.midY
        let margin:CGFloat = midY - height_2
        
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
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func touchedAt(point:CGPoint)
    {
        layoutRacketTop.constant = point.y - height_2
    }
}