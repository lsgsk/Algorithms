import Foundation

class Node: Equatable, Hashable {
	let id: String
	let name: String
	var links: [Link] = []
	var distance: Int = Int.max
	
	init(name: String) {
		self.id = UUID().uuidString
		self.name = name
		self.links = []
	}
	static func == (lhs: Node, rhs: Node) -> Bool {
		return lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		id.hash(into: &hasher)
	}
}

struct Link {
	let fromNode: Node
	let cost: Int
	let toNode: Node
}
