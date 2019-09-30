
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

func isConnected(startNode: Node, collection: [Node]) -> Bool {
	var fullNodesCollection = Set<String>(collection.map { $0.id })
	var visitedNodesCollection = Set<String>()
	func travers(node: Node) {
		visitedNodesCollection.insert(node.id)
		fullNodesCollection.remove(node.id)
		for link in node.links  {
			if !visitedNodesCollection.contains(link.toNode.id) {
				travers(node: link.toNode)
			}
		}
	}
	travers(node: startNode)
	return fullNodesCollection.count == 0
}

func getConnectedComponents(nodes: [Node]) -> [[Node]] {
	var numVisited = 0
	var components = [[Node]]()
	while numVisited < nodes.count {
		let startNode = nodes[numVisited]
		let stack = Stack<Node>()
		stack.push(item: startNode)
		numVisited += 1
		var component = [Node]()
		
		while let node = stack.pop() {
			if !node.visited {
				node.visited = true
				component.append(node)
				for link in node.links {
					if !link.toNode.visited {
						stack.push(item: link.toNode)
					}
				}
			}
		}
		components.append(component)
		nodes.forEach({ $0.visited = false })
	}
	return components
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

print(isConnected(startNode: a, collection: [a,b,c,d,e,f,g,h,i]))


let grapths = getConnectedComponents(nodes: [a,b,c,d,e,f,g,h,i])
for item in grapths {
	print(item.reduce("") {$0 + $1.name + " "})
}
