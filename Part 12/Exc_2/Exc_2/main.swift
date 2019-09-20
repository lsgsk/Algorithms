var noughtsCount = 0
var crossesCount = 0
var drawCount = 0

func calculateGamesCount(board: GameBoard, player1: Player, player2: Player) -> Int {
	var count = 0
	let availableMoves = board.getAvailableTurns()
	for move in availableMoves {
		player1.addMove(move)
		switch board.calculateGameResult() {
		case .unknown:
			count += calculateGamesCount(board: board, player1: player2, player2: player1)
		case .win, .draw:
			count += 1
		}
		player1.removeMove(move)
	}
	return count
}

func countGamesForFirstPosition(_ turn: Int, _ board: GameBoard, _ player1: Player, _ player2: Player) {
	//player1.addMove(turn)
	let count = calculateGamesCount(board: board, player1: player1, player2: player2)
	print("There are \(count) games for \(turn) first step")
	//player1.removeMove(turn)
}

let crossesPlayer = Player(type: .crosses)
let noughtsPlayer = Player(type: .noughts)
let board = GameBoard(player1: crossesPlayer, player2: noughtsPlayer)
countGamesForFirstPosition(0, board, crossesPlayer, noughtsPlayer)
countGamesForFirstPosition(1, board, crossesPlayer, noughtsPlayer)
countGamesForFirstPosition(4, board, crossesPlayer, noughtsPlayer)


