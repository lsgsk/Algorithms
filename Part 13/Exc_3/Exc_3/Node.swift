import Foundation

class Node: Equatable {
	let id: String
	let name: String
	var links: [Link]
	var visited: Bool
	init(name: String) {
		self.id = UUID().uuidString
		self.name = name
		self.links = []
		self.visited = false
	}
	init(name: String, links: [Link]) {
		self.id = UUID().uuidString
		self.name = name
		self.links = links
		self.visited = false
	}
	static func == (lhs: Node, rhs: Node) -> Bool {
		return lhs.id == rhs.id
	}
}

struct Link {
	let cost: Int
	let toNode: Node
}
