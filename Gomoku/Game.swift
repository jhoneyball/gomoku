class Game {
    let board: BoardProtocol
    var player = Player.White
    var rules: GomokuRules
    
    init (board: BoardProtocol, rules: GomokuRules) {
        self.board = board
        self.rules = rules
    }
    
    func takeTurn(intersection: Intersection) {
        if board.get(intersection: intersection) == Player.Empty {
            board.place(intersection: intersection, player: whosTurn())
            if (rules.checkIsWin(board: board as! Board, intersection: intersection, player: player)) {
                print ("Game Over")
            }
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
