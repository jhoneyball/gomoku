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
        
        
        let horizontal = countHorizontal(board: board, intersection: intersection, player: player)
        let vertical = countVertical(board: board, intersection: intersection, player: player)
        let diaganolBLTR = countDiagonalBLTR(board: board, intersection: intersection, player: player)
        let diaganolTLBR = countDiagonalTLBR(board: board, intersection: intersection, player: player)
        
        print ("\(player) : \(horizontal) horizontal. \(vertical) vertical. \(diaganolBLTR) BLTR diagonal. \(diaganolTLBR) TLBR diagonal.")
        
        if horizontal > 4 || vertical > 4 || diaganolBLTR > 4 || diaganolTLBR > 4 {
            return true
        }
        return false
    }
    
    func countHorizontal (board: Board, intersection: Intersection, player: Player) -> Int  {
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
        return horizontal
    }
    
    func countVertical (board: Board, intersection: Intersection, player: Player) -> Int {
        
        var vertical = 1
        var cursor = intersection
        while board.above(of: cursor) != nil && board.get(intersection: board.above(of: cursor)!) == player {
            vertical += 1
            cursor = board.above(of: cursor)!
        }
        cursor = intersection
        while board.below(of: cursor) != nil && board.get(intersection: board.below(of: cursor)!) == player {
            vertical += 1
            cursor = board.below(of: cursor)!
        }
        return vertical
    }
    
    func countDiagonalBLTR (board: Board, intersection: Intersection, player: Player) -> Int {
        
        var diaganolBLTR = 1
        var cursor = intersection
        
        while board.rightAbove(of: cursor) != nil && board.get(intersection: board.rightAbove(of: cursor)!) == player {
            diaganolBLTR += 1
            cursor = board.rightAbove(of: cursor)!
        }
        cursor = intersection
        while board.leftBelow(of: cursor) != nil && board.get(intersection: board.leftBelow(of: cursor)!) == player {
            diaganolBLTR += 1
            cursor = board.leftBelow(of: cursor)!
        }
        return diaganolBLTR
    }
    
    func countDiagonalTLBR (board: Board, intersection: Intersection, player: Player) -> Int {
        //diaganol TLBR check
        var diaganolTLBR = 1
        var cursor = intersection
        while board.leftAbove(of: cursor) != nil && board.get(intersection: board.leftAbove(of: cursor)!) == player {
            diaganolTLBR += 1
            cursor = board.leftAbove(of: cursor)!
        }
        cursor = intersection
        while board.rightBelow(of: cursor) != nil && board.get(intersection: board.rightBelow(of: cursor)!) == player {
            diaganolTLBR += 1
            cursor = board.rightBelow(of: cursor)!
        }
        return diaganolTLBR
    }
}

