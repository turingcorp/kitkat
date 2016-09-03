import UIKit

class VGame:UIView
{
    weak var controller:CGame!
    weak var racket:VGameRacket!
    weak var layoutRacketTop:NSLayoutConstraint!
    private let kRacketWidth:CGFloat = 30
    private let kRacketHeight:CGFloat = 100
    private let kRacketLeft:CGFloat = 30
    
    init(controller:CGame)
    {
        let height:CGFloat = UIScreen.mainScreen().bounds.maxY
        let remain:CGFloat = height - kRacketHeight
        let margin:CGFloat = remain / 2.0
        
        super.init(frame:CGRectZero)
        backgroundColor = UIColor.whiteColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let racket:VGameRacket = VGameRacket(controller:controller)
        self.racket = racket
        
        addSubview(racket)
        
        let views:[String:AnyObject] = [
            "racket":racket]
        
        let metrics:[String:AnyObject] = [
            "racketLeft":kRacketLeft,
            "racketWidth":kRacketWidth,
            "racketHeight":kRacketHeight]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(racketLeft)-[racket(racketWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[racket(racketHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutRacketTop = NSLayoutConstraint(
            item:racket,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:margin)
        
        addConstraint(layoutRacketTop)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}