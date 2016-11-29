class Game {
    let board: BoardProtocol
    var player = Player.White
    
    init (board: BoardProtocol, rules: GomokuRules) {
        self.board = board
    }
    
    func takeTurn(intersection: Intersection) {
        if board.get(intersection: intersection) == Player.Empty {
            board.place(intersection: intersection, player: whosTurn())
            player = other(player: player)          
        }
    }
    
    func other(player: Player) -> Player {
        return player == Player.White ? Player.Black : Player.White
    }
    
    
    func whosTurn() -> Player {
        return player
    }
}
