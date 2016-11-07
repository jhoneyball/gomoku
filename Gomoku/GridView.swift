

import UIKit

class GridView: UIView {

    let board: Board
    var tapper: UITapGestureRecognizer!
    
    init (frame: CGRect, board: Board){
        self.board = board
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
        let intersection = getCoOrdsForCGPont(cGPoint: locationOfTap, width: frame.size.width, height: frame.size.height, columns: board.getWidth(), rows: board.getHeight())
        print ("clicked column:\(intersection.column) row:\(intersection.row)")
        
        do {
            try board.place(intersection: intersection, player: Player.White)
        } catch {
            // do nothing
        }
        
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {

 //       let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath()
        path.lineWidth = 1
        
        let lines = calculateGoBoardLines(width: rect.size.width,
                                          height: rect.size.height,
                                          columns: board.getWidth(), rows: board.getHeight())
        
        for i in 0..<lines.count {
            path.move(to: lines[i].start)
            path.addLine(to: lines[i].finish)
        }
  
        path.stroke()
        path.removeAllPoints()
        
        for col in 0..<board.getWidth() {
            for row in 0..<board.getHeight() {
                let stone = try! board.get(intersection: Intersection(column: col, row: row))
                if stone != Player.Empty {
                    
                    let centre = getCGPointForCoOrds(col: col,
                                                     row: row,
                                                     columns: board.getWidth(),
                                                     rows: board.getHeight(),
                                                     width: rect.size.width,
                                                     height: rect.size.height)
                    let radius = getRadiusForDimensions(cols: board.getWidth(), width: rect.size.width)

                    path.move(to: centre)
                    if stone == Player.White {
                        UIColor.white.set()
                    } else {
                        UIColor.black.set()
                    }
                    path.addArc(withCenter: centre, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI) * CGFloat(2.0), clockwise: true)
                    path.fill()
                    path.removeAllPoints()
                    UIColor.black.set()
                    path.addArc(withCenter: centre, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI) * CGFloat(2.0), clockwise: true)
                    path.stroke()
                    path.removeAllPoints()
                    
                }
            }
        }
        
//        context!.addPath (path.cgPath)
//        UIGraphicsEndImageContext()
    }
}
