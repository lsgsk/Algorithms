import Foundation







class Move: Equatable {
	let position: Int
	
	init(position: Int) {
		self.position = position
	}
	
	static func == (lhs: Move, rhs: Move) -> Bool {
		return lhs.position == rhs.position
	}
}

enum Value: Int {
	case win
	case draw
	case loss
	case unknown
	case infinity
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

func minimax(board: GameBoard, best_move: inout Move, best_value: inout Value, player1: Player, player2: Player, depth: Int, max_depth: Int) {
	if depth > max_depth {
		best_value = .unknown
		return
	}
	var lowest_value = Value.infinity
	var lowest_move = Move(position: 0)
	
	for moveIndex in board.getAvailableMoves() {
		player1.addMove(Move(position: moveIndex))
		//print("\(board.printBoard())")
		switch board.calculateGameResult() {
		case .win(let type):
			lowest_move = Move(position: moveIndex)
			lowest_value = type == player1.type ? .win : .loss
		//print("-----")
		case .draw:
			lowest_move = Move(position: moveIndex)
			lowest_value = .draw
		//print("-----")
		case .unknown:
			var test_value = Value.unknown
			var test_move = Move(position: 0)
			minimax(board: board, best_move: &test_move, best_value: &test_value, player1: player2, player2: player1, depth: depth, max_depth: max_depth)
			if test_value.rawValue < lowest_value.rawValue {
				lowest_value = test_value
				lowest_move = test_move
			}
		}
		player1.removeMove(Move(position: moveIndex))
	}
	
	best_move = lowest_move
	if lowest_value == .win {
		best_value = .loss
	}
	else if lowest_value == .loss {
		best_value = .win
	}
}


func computerMove(board: GameBoard, player: Player, computer: Player) {
	var next_value = Value.unknown
	var next_move = Move(position: 0)
	minimax(board: board, best_move: &next_move, best_value: &next_value, player1: player, player2: computer, depth: 1, max_depth: 100)
	computer.addMove(next_move)
}

let crossesPlayer = Player(type: .crosses)
let noughtsPlayer = Player(type: .noughts)
let board = GameBoard(player1: crossesPlayer, player2: noughtsPlayer)
var gameFinished = false
while !gameFinished {
	print("Enter your next step (0-8)")
	print(board.printBoard())
	if let nextStep = readLine(), let nextStepIndex = Int(nextStep) {
		crossesPlayer.addMove(nextStepIndex)
		computerMove(board: board, player: crossesPlayer, computer: noughtsPlayer)
		switch board.calculateGameResult() {
		case .win(let layer):
			print("\(layer)")
			gameFinished = true
		case .draw:
			gameFinished = true
		case .unknown:
			break
		}
	}
	else {
		print("Incorrect value. Enter your next step, using digits from 0 to 8")
	}
}
