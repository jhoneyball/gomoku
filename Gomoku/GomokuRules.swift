class GomokuRules {
    func isWin(board: Board) throws -> Bool {
        
        var playerPiecesInARow = 0
        var fiveOrMoreInARow : Bool = false
        
        for row in 0..<board.getRows() {
            playerPiecesInARow = 0
            for col in 0..<board.getColumns() {
                let playerPiece = try board.get(intersection: Intersection(row, col))
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
