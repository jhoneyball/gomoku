

import UIKit

class GridView: UIView {

    let boardPresenter: BoardPresenter
    var tapper: UITapGestureRecognizer!
    
    init (frame: CGRect, board: Board){
        self.boardPresenter = BoardPresenter(board: board, frame: frame)
        super.init(frame: frame)
        self.tapper = UITapGestureRecognizer(target: self, action:#selector(self.tapped(_:)))
        self.addGestureRecognizer(self.tapper)
        
        self.backgroundColor = UIColor(colorLiteralRed: 240/255.0, green: 200/255.0, blue: 150/255.0, alpha: 1)
        print("init")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func tapped(_ tapper: UITapGestureRecognizer){
        let locationOfTap = tapper.location(ofTouch: 0, in: self)

        boardPresenter.tap(location: locationOfTap)
        
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        // Draw grid lines
        let path = UIBezierPath()
        path.lineWidth = 1
        let lines = boardPresenter.calculateGoBoardLines()
        
        for i in 0..<lines.count {
            path.move(to: lines[i].start)
            path.addLine(to: lines[i].finish)
        }
        path.stroke()
        path.removeAllPoints()

        // Draw stones
        let stoneCoOrds = boardPresenter.calculateStonCoOrds()
        for i in 0..<stoneCoOrds.count {
            path.move(to: stoneCoOrds[i].centre)
            if stoneCoOrds[i].colour == StoneColour.WHITE {
                UIColor.white.set()
            } else {
                UIColor.black.set()
            }

            path.addArc(withCenter: stoneCoOrds[i].centre, radius: stoneCoOrds[i].radius, startAngle: 0, endAngle: CGFloat(M_PI) * CGFloat(2.0), clockwise: true)
            path.fill()
            path.removeAllPoints()
            UIColor.black.set()
            path.addArc(withCenter: stoneCoOrds[i].centre, radius: stoneCoOrds[i].radius, startAngle: 0, endAngle: CGFloat(M_PI) * CGFloat(2.0), clockwise: true)
            path.stroke()
            path.removeAllPoints()
        }
    }
}
