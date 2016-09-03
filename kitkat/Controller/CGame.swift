import UIKit

class CGame:CController
{
    weak var viewGame:VGame!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    override func loadView()
    {
        let viewGame:VGame = VGame(controller:self)
        self.viewGame = viewGame
        view = viewGame
    }
}