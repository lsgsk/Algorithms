import Foundation

struct Constants {
	static let boardSideCount = 3
}

enum PlayerType {
	case noughts
	case crosses
}

enum GameResult {
	case unknown
	case win(PlayerType)
	case draw
}
