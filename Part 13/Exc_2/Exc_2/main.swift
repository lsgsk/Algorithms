import Foundation

func traversInDepth(node: Node) -> String {
	var path = ""
	var visited = Set<String>()
	func innerTravers(node: Node) {
		path += "\(node.name) "
		visited.insert(node.id)
		for link in node.links  {
			if !visited.contains(link.toNode.id) {
				innerTravers(node: link.toNode)
			}
		}
	}
	innerTravers(node: node)
	return path
}

func traversInWidth(node: Node) -> String {
	var path = ""
	var visited = Set<String>()
	let queue = Queue<Node>()
	queue.enqueue(value: node)
	visited.insert(node.id)
	while let item = queue.dequeue() {
		path += "\(item.name) "
		for link in item.links  {
			if !visited.contains(link.toNode.id) {
				queue.enqueue(value: link.toNode)
				visited.insert(link.toNode.id)
			}
		}
	}
	return path
}

let a = Node(name: "A")
let b = Node(name: "B")
let c = Node(name: "C")
let d = Node(name: "D")
let e = Node(name: "E")
let f = Node(name: "F")
let g = Node(name: "G")
let h = Node(name: "H")

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

print(traversInDepth(node: a))
print(traversInWidth(node: a))
