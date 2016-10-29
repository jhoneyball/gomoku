

import UIKit

class GridView: UIView {

    let board: Board
    
    init (frame: CGRect, board: Board){
        self.board = board
        super.init(frame: frame)
        self.backgroundColor = UIColor(colorLiteralRed: 255/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
//    override func drawrect(rect: CGRect) {
//
//    }

}
