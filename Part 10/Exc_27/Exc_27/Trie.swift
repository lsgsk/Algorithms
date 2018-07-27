import Cocoa

class Trie : CustomStringConvertible {
    private var root : TrieNode
    init() {
        self.root = TrieNode("*", 0)
    }
    func addValue(_ key: inout String, _ new: Int){
        buildBranch(root, &key, new)
    }
    private func buildBranch(_ leaf: TrieNode, _ key: inout String, _ new: Int){
        if !key.isEmpty{
            let ch = String(key.remove(at: key.startIndex))
            if let subnode = leaf.children.filter({$0.key == ch}).first{
                buildBranch(subnode, &key, new)
            } else{
                let newnode = TrieNode(ch, key.isEmpty ? new : nil)
                leaf.children.append(newnode)
                if !key.isEmpty{
                    buildBranch(newnode, &key, new)
                }
            }
        }
    }
    
    func print(){
        var empty = ""
        root.printPretty(&empty, true);
    }
    
    var description: String{
        var str = ""
        let children = ListQueue<TrieNode>()
        children.Enqueue(root)
        var countInLevel = 1
        while !children.isEmpty {
            if countInLevel == 0{
                countInLevel = children.Count
                str += "\n"
            }
            if let node = children.Dequeue(){
                str += "\(node.key) "
                for item in node.children{
                    children.Enqueue(item)
                }
                if let value = node.value{
                    str += "\n\(value)"
                }
            }
            countInLevel -= 1
        }
        return str
    }
}

class TrieNode{
    var key: String
    var value : Int?
    var children : [TrieNode]
    init(_ key : String, _ value: Int? = nil) {
        self.key = key
        self.value = value
        self.children = []
    }
    fileprivate func printPretty(_ indent : inout String, _ last : Bool)
    {
        print(indent, terminator: "")
        if (last)
        {
            print("└─", terminator: "")
            indent += "  ";
        }
        else
        {
            print("├─", terminator: "")
            indent += "| ";
        }
        print("\(self.key)\(self.value != nil ? (" -> \(self.value!) ") : "")");
        
        var kinders : [TrieNode] = [];
        for item in children{
            kinders.append(item)
        }
        for i in 0..<kinders.count{
            var temp_indent = indent
            kinders[i].printPretty(&temp_indent, i == kinders.count - 1);
        }
    }
}
