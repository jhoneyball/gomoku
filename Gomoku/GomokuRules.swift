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
}
