import Foundation

class GameBoard {
	let player1: Player
	let player2: Player
	init(player1: Player, player2: Player) {
		self.player1 = player1
		self.player2 = player2
	}
	
	func getAvailableTurns() -> [Move] {
		let positions = generateBoardState()
		var movesArray = [Move]()
		for (index, item) in positions.enumerated() {
			if item == nil {
				movesArray.append(Move(position: index))
			}
		}
		return movesArray
	}
	
	func calculateGameResult() -> GameResult {
		let positions = generateBoardState()
		return checkGameResult(positions)
	}
	
	private func generateBoardState() -> [PlayerType?] {
		var positions = [PlayerType?](repeating: nil, count: Constants.boardSideCount * Constants.boardSideCount)
		setExecutedPlayerMoves(board: &positions, player: player1)
		setExecutedPlayerMoves(board: &positions, player: player2)
		return positions
	}
	
	private func setExecutedPlayerMoves(board: inout [PlayerType?], player: Player) {
		for (index, item) in player.moves.enumerated() {
			if item {
				board[index] = player.type
			}
		}
	}
	private func checkGameResult(_ board: [PlayerType?]) -> GameResult {
		if board[0] != nil &&  board[0] == board[1] && board[1] == board[2] {
			return GameResult.win(board[0]!)
		}
		if board[3] != nil &&  board[3] == board[4] && board[4] == board[5] {
			return GameResult.win(board[3]!)
		}
		if board[6] != nil &&  board[6] == board[7] && board[7] == board[8] {
			return GameResult.win(board[6]!)
		}
		
		if board[0] != nil &&  board[0] == board[3] && board[3] == board[6] {
			return GameResult.win(board[0]!)
		}
		if board[1] != nil &&  board[1] == board[4] && board[4] == board[7] {
			return GameResult.win(board[1]!)
		}
		if board[2] != nil &&  board[2] == board[5] && board[5] == board[8] {
			return GameResult.win(board[2]!)
		}
		
		if board[0] != nil &&  board[0] == board[4] && board[4] == board[8] {
			return GameResult.win(board[0]!)
		}
		if board[2] != nil &&  board[2] == board[4] && board[4] == board[6] {
			return GameResult.win(board[2]!)
		}
		
		if !board.contains(nil) {
			return .draw
		}
		
		return .unknown
	}
	
	func printBoard() -> String {
		let positions = generateBoardState()
		var str = ""
		var newLine = 0
		for element in positions {
			switch element {
			case .noughts?:
				str += "0 "
			case .crosses?:
				str += "X "
			default:
				str += "_ "
			}
			newLine += 1
			if newLine % 3 == 0 {
				str += "\n"
			}
		}
		return str
	}
}

class Player {
	let type: PlayerType
	private(set) var moves: [Bool]
	init(type: PlayerType) {
		self.type = type
		self.moves = [Bool](repeating: false, count: Constants.boardSideCount * Constants.boardSideCount)
	}
	
	func addMove(_ move: Int) {
		moves[move] = true
	}
	
	func addMove(_ move: Move) {
		moves[move.position] = true
	}
	func removeMove(_ move: Move) {
		moves[move.position] = false
	}
}
