import Foundation

class Node: Equatable {
	let id: String
	let name: String
	var links: [Link]
	
	init(name: String) {
		self.id = UUID().uuidString
		self.name = name
		self.links = []
	}
	init(name: String, links: [Link]) {
		self.id = UUID().uuidString
		self.name = name
		self.links = links
	}
	static func == (lhs: Node, rhs: Node) -> Bool {
		return lhs.id == rhs.id
	}
}

struct Link {
	let cost: Int
	let toNode: Node
}

struct LinkPair {
	let fromNode: Node
	let cost: Int
	let toNode: Node
}

class Stack<T> {
	private var curret: StackCell<T>?
	func push(item: T){
		let cell = StackCell(value: item)
		if curret == nil{
			curret = cell
		}
		else{
			cell.prev = curret
			curret = cell
		}
	}
	func pop() -> T?{
		if curret != nil{
			let value = curret?.value
			curret = curret?.prev
			return value
		}else{
			return nil
		}
	}
	
	func dump() -> [T]{
		var array = [T]()
		var cell = curret
		while let item = cell {
			array.append(item.value)
			cell = cell?.prev
		}
		return array
	}
	
	var count : Int{
		get{
			var length = 0;
			var cell = curret
			while let _ = cell {
				length += 1
				cell = cell?.prev
			}
			return length
		}
	}
}

fileprivate class StackCell<T>{
	init(value:T) {
		self.value = value
	}
	let value : T
	var prev : StackCell<T>?
}

func findWayToNode(startNode: Node, finishNode: Node) -> [LinkPair] {
	var ostov = [LinkPair]()
	var applicants = [LinkPair]()
	applicants.append(contentsOf: startNode.links.map { LinkPair(fromNode: startNode, cost: $0.cost, toNode: $0.toNode)})
	while let next = applicants.min(by: { (a, b) -> Bool in a.cost < b.cost }) {
		ostov.append(next)
		applicants.removeAll(where: { $0.toNode == next.toNode })
		applicants.append(contentsOf: next.toNode.links.filter { !ostov.map { $0.toNode}.contains( $0.toNode) }.map { LinkPair(fromNode: next.toNode, cost: $0.cost, toNode: $0.toNode) })
	}
	var way = [LinkPair]()
	var pointId = finishNode.id
	print(finishNode.name)
	repeat {
		if let link = ostov.first(where: { $0.toNode.id == pointId }){
			way.append(link)
			pointId = link.fromNode.id
			print(link.fromNode.name)
		}
		else {
			pointId = ""
		}
	} while !pointId.isEmpty && pointId != startNode.id
	return way.reversed()
}

let a = Node(name: "A")
let b = Node(name: "B")
let c = Node(name: "C")
let d = Node(name: "D")
let e = Node(name: "E")
let f = Node(name: "F")
let g = Node(name: "G")
let h = Node(name: "H")
let i = Node(name: "I")

a.links.append(Link(cost: 9, toNode: b))
a.links.append(Link(cost: 10, toNode: d))
a.links.append(Link(cost: 15, toNode: e))
b.links.append(Link(cost: 10, toNode: c))
c.links.append(Link(cost: 11, toNode: f))
d.links.append(Link(cost: 10, toNode: e))
d.links.append(Link(cost: 12, toNode: g))
e.links.append(Link(cost: 11, toNode: f))
g.links.append(Link(cost: 12, toNode: h))
h.links.append(Link(cost: 13, toNode: f))
i.links.append(Link(cost: 3, toNode: d))

print(findWayToNode(startNode: a, finishNode: h).reduce("", { (r, l) -> String in  "\(r)\(l.fromNode.name)-\(l.cost)-\(l.toNode.name) \n" }))
