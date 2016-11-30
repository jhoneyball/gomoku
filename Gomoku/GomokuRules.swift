class GomokuRules {
    func isWin(board: Board) -> Bool {
        
        var player: Player
        var intersectionToCheck: Intersection
 
    
        for col in 0..<board.getColumns() {
            for row in 0..<board.getRows() {
                intersectionToCheck = Intersection(column: col, row: row)
                player = board.get(intersection: intersectionToCheck)
                if player != Player.Empty {
                    if (checkIsWin(board: board, intersection: intersectionToCheck, player: player)) {
                        return true
                    }
                }
            
            }
        }
        return false
    }
    
    func checkIsWin(board: Board, intersection: Intersection, player: Player) -> Bool {
        var horizontal = 1
        var cursor = intersection
        
        //horizontal checks
        while board.right(of: cursor) != nil && board.get(intersection: board.right(of: cursor)!) == player {
            horizontal += 1
            cursor = board.right(of: cursor)!
        }
        cursor = intersection
        while board.left(of: cursor) != nil && board.get(intersection: board.left(of: cursor)!) == player {
            horizontal += 1
            cursor = board.left(of: cursor)!
        }
        if horizontal >= 5 {
            print ("Horizontal Win for \(player)")
            return true
        }

        //vertical checks
        var vertical = 1
        cursor = intersection
        while board.above(of: cursor) != nil && board.get(intersection: board.above(of: cursor)!) == player {
            vertical += 1
            cursor = board.above(of: cursor)!
        }
        cursor = intersection
        while board.below(of: cursor) != nil && board.get(intersection: board.below(of: cursor)!) == player {
            vertical += 1
            cursor = board.below(of: cursor)!
        }
        if vertical >= 5 {
            print ("Vertical Win for \(player)")
            return true
        }
 
        //diaganol BLTR check
        var diaganolBLTR = 1
        cursor = intersection
        while board.rightAbove(of: cursor) != nil && board.get(intersection: board.rightAbove(of: cursor)!) == player {
            diaganolBLTR += 1
            cursor = board.rightAbove(of: cursor)!
        }
        cursor = intersection
        while board.leftBelow(of: cursor) != nil && board.get(intersection: board.leftBelow(of: cursor)!) == player {
            diaganolBLTR += 1
            cursor = board.leftBelow(of: cursor)!
        }
        if diaganolBLTR >= 5 {
            print ("BLTR Win for \(player)")
            return true
        }

        
        //diaganol TLBR check
        var diaganolTLBR = 1
        cursor = intersection
        while board.leftAbove(of: cursor) != nil && board.get(intersection: board.leftAbove(of: cursor)!) == player {
            diaganolTLBR += 1
            cursor = board.leftAbove(of: cursor)!
        }
        cursor = intersection
        while board.rightBelow(of: cursor) != nil && board.get(intersection: board.rightBelow(of: cursor)!) == player {
            diaganolTLBR += 1
            cursor = board.rightBelow(of: cursor)!
        }
        if diaganolTLBR >= 5 {
            print ("TLBR Win for \(player)")
            return true
        }

        print ("\(player) : \(horizontal) horizontal. \(vertical) vertical. \(diaganolBLTR) BLTR diagonal. \(diaganolTLBR) TLBR diagonal.")
    return false
    }
}
