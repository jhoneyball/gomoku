

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
  

    
    override func draw(_ rect: CGRect) {
        
        let outerBoxSize = min (rect.size.width, rect.size.height)
        let cellCount = board.getWidth() + 1
        let cellSize = outerBoxSize / CGFloat(board.getWidth()) + 1.0
        
        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath()
        for i in 1..<cellCount {
            let xPosition = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: xPosition, y: cellSize))
            path.addLine(to: CGPoint(x: xPosition, y: outerBoxSize - cellSize))
        }
        
        path.lineWidth = 1
        path.stroke()
        context!.addPath (path.cgPath)
        UIGraphicsEndImageContext()
    }
}
