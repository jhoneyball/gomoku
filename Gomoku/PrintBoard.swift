
class PrintBoard {
    
    func  printAsSingleString(board: Board) -> String {
        var stringToBuild: String = ""
        var player: Player
        
        for row in 0...board.getHeight()-1 {
            for col in 0...board.getWidth()-1 {
                player = try! board.get(intersection: Intersection(row, col))
                switch (player) {
                case Player.Black:
                        stringToBuild.append("B")
                case Player.White:
                        stringToBuild.append("W")
                default:
                        stringToBuild.append("0")
                }
            }
        }
        return stringToBuild
    }
    
    func  printAsFormattedString(board: Board) -> String {
        var stringToBuild: String = ""
        var player: Player
        
        for row in 0...board.getHeight()-1 {
            for col in 0...board.getWidth()-1 {
                player = try! board.get(intersection: Intersection(row, col))
                switch (player) {
                case Player.Black:
                    stringToBuild.append("B")
                case Player.White:
                    stringToBuild.append("W")
                default:
                    stringToBuild.append("0")
                }
            }
            stringToBuild.append("\r\n")
        }
        return stringToBuild
    }
}
