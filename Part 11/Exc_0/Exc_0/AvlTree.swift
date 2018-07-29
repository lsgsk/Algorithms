import Cocoa

class AvlTree: CustomStringConvertible {
    var root : Node?
    
    func add(_ value : Int){
        if var root = self.root{
            addNode(&root, value)
        }
        else{
            root = Node(value)
        }
    }
    
    private func addNode(_ node : inout Node, _ newValue: Int){
        if newValue < node.value{
            if var left = node.left{
                addNode(&left, newValue)
            }else{
                node.left = Node(newValue)
            }
        }else{
            if var right = node.right{
                addNode(&right, newValue)
            }else{
                node.right = Node(newValue)
            }
        }
        node = balance(node) ?? node
    }
    
    private func height(_ node: Node?) -> Int{
        return node?.height ?? 0
    }
    
    private func bfactor(_ node : Node?) -> Int
    {
        return height(node?.right)-height(node?.left);
    }
    
    func rotateright(_ p : Node?) -> Node?{
        let q = p?.left;
        p?.left = q?.right;
        q?.right = p;
        fixheight(p);
        fixheight(q);
        return q;
    }
    
    func rotateleft(_ q : Node?) -> Node?{
        let p = q?.right;
        q?.right = p?.left;
        p?.left = q;
        fixheight(q);
        fixheight(p);
        return p;
    }
    
    private func fixheight(_ node : Node?)
    {
        let hl = height(node?.left);
        let hr = height(node?.right);
        node?.height = (hl > hr ? hl : hr) + 1;
    }
    
    private func balance(_ node : Node) -> Node?{
        fixheight(node);
        if(bfactor(node)==2 )
        {
            if(bfactor(node.right) < 0 ){
                 node.right = rotateright(node.right);
            }
            return rotateleft(node);
        }
        if(bfactor(node) == -2)
        {
            if(bfactor(node.left) > 0){
                 node.left = rotateleft(node.left);
            }
            return rotateright(node);
        }
        return node; // балансировка не нужна
    }
    
    
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
}

class Node{
    var value : Int
    var height : Int
    var left : Node?
    var right : Node?
    init(_ value : Int) {
        self.value = value
        self.height = 1
    }
}


