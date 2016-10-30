

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

        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath()
        let lines = calculateGoBoardLines(width: rect.size.width,
                                          height: rect.size.height,
                                          columns: board.getWidth(), rows: board.getHeight())
        
        for i in 0..<lines.count {
            path.move(to: lines[i].start)
            path.addLine(to: lines[i].finish)
        }
        
        path.lineWidth = 1
        path.stroke()
        context!.addPath (path.cgPath)
        UIGraphicsEndImageContext()
    }
}
