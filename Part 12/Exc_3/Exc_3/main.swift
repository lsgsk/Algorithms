import Foundation

func minimax(board: GameBoard, best_move: inout Move, best_value: inout Value, player1: Player, player2: Player, depth: Int, max_depth: Int) {
	if depth > max_depth {
		best_value = .unknown
		return
	}
	var lowest_value = Value.infinity
	var lowest_move = Move(position: 0)
	
	for move in board.getAvailableTurns() {
		player1.addMove(move)
		switch board.calculateGameResult() {
		case .win(let type):
			lowest_move = move
			lowest_value = type == player1.type ? .win : .loss
		case .draw:
			lowest_move = move
			lowest_value = .draw
		case .unknown:
			var test_value = Value.unknown
			var test_move = Move(position: 0)
			minimax(board: board, best_move: &test_move, best_value: &test_value, player1: player2, player2: player1, depth: depth, max_depth: max_depth)
			if test_value.rawValue < lowest_value.rawValue {
				lowest_value = test_value
				lowest_move = test_move
			}
		}
		player1.removeMove(move)
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
let maxTurnIndex = Constants.boardSideCount * Constants.boardSideCount
while !gameFinished {
	print("Enter your next turn, using digits from 0 to 8")
	print(board.printBoard())
	if let nextStep = readLine(), let nextStepIndex = Int(nextStep), nextStepIndex >= 0, nextStepIndex < maxTurnIndex {
		if !board.getAvailableTurns().contains(where: { $0.position == nextStepIndex }) {
			print("Incorrect turn. Position already used")
		}
		else {
			crossesPlayer.addMove(nextStepIndex)
			computerMove(board: board, player: crossesPlayer, computer: noughtsPlayer)
			switch board.calculateGameResult() {
			case .win(let layer):
				print(board.printBoard())
				print("Congratulations! \(layer) has win")
				gameFinished = true
			case .draw:
				print(board.printBoard())
				print("The game is over. It`s draw")
				gameFinished = true
			case .unknown:
				break
			}
		}
	}
	else {
		print("Incorrect value. Use only digits from 0 to 8")
	}
}
