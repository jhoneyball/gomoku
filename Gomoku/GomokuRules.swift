class GomokuRules {
    func isWin(board: Board) -> Bool {
        
        var playerPiecesInARow = 0
        var fiveOrMoreInARow : Bool = false
        
        for row in 0..<board.getRows() {
            playerPiecesInARow = 0
            for col in 0..<board.getColumns() {
                let playerPiece = board.get(intersection: Intersection(column: col, row: row))
                if playerPiece == Player.White {
                    playerPiecesInARow += 1
                }
                if (playerPiecesInARow > 4) {
                    fiveOrMoreInARow  = true
                }
            }
        }
        return fiveOrMoreInARow
    }
    
    func checkIsWin(board: Board, intersection: Intersection, player: Player) -> Bool {
        var horizontal = 1
        var cursor = intersection
        
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
            print ("Win for \(player)")
            return true
        }

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
            print ("Win for \(player)")
            return true
        }
        print ("\(player) : \(horizontal) horizontal. \(vertical) vertical")
    return false
    }
}
