import Cocoa

class AvlTree: CustomStringConvertible {
    private var root : AvlNode?
    
    //Add block
    func addNode(_ value: Int){
        if let root = root{
            addNode(root, value) //важна именно родительская рутовая ссылка
        } else{
            root = AvlNode(value)
        }
    }
    private func addNode(_ node : AvlNode, _ value: Int){
        if value < node.value{
            if let left = node.left{
                addNode(left, value)
            }else{
                node.left = AvlNode(value)
            }
        }else{
            if let right = node.right{
                addNode(right, value)
            }else{
                node.right = AvlNode(value)
            }
        }
        //node = balance(node)
    }
    
    //Remove block
    
    func removeNode(_ target: Int){
        removeNode(nil, self.root, target)
    }
    
    private func removeNode(_ parent : AvlNode?, _ viewed : AvlNode?, _ target: Int){
        if let fviewed = viewed{
            if target == fviewed.value{
                if var fparent = parent{
                    if fviewed.left == nil && fviewed.right == nil{
                        removeTerminalLeaf(&fparent, fviewed)
                    }
                    else if fviewed.left == nil || fviewed.right == nil{
                        removeWithOneChildLeaf(&fparent, fviewed)
                    }
                    else{
                        removeWithTwoChildren(&fparent, fviewed)
                    }
                }else{
                    //особый случай для корня
                    if fviewed.left == nil && fviewed.right == nil{
                        removeLonelyRoot()
                    }
                    else if fviewed.left == nil || fviewed.right == nil{
                        removeRootWithOneChildLeaf()
                    }
                    else{
                        removeRootWithTwoChildren()
                    }
                }
            }else if target < fviewed.value{
                return removeNode(fviewed, fviewed.left, target)
            }else{
                return removeNode(fviewed, fviewed.right, target)
            }
        }
    }
    private func removeLonelyRoot(){
        self.root = nil
    }
    private func removeRootWithOneChildLeaf(){
        root = root?.left ?? root?.right
    }
    private func removeRootWithTwoChildren(){
        if root?.left?.right == nil{
            let viewedright = root?.right
            root = root?.left
            root?.right = viewedright
        }else{
            var tparemt : AvlNode? = root
            var tviewed : AvlNode? = root
            while tviewed?.left?.right != nil{
                tparemt = tviewed?.left
                tviewed = tviewed?.left?.right
            }
            let viewedleft = root?.left
            let viewedright = root?.right
            tparemt?.right = tviewed?.left
            root = tviewed
            root?.left = viewedleft
            root?.right = viewedright
        }
    }
    
    
    private func removeTerminalLeaf(_ parent : inout AvlNode, _ viewed: AvlNode){
        if parent.left === viewed{
            parent.left = nil
        }else{
            parent.right = nil
        }
    }
    private func removeWithOneChildLeaf(_ parent : inout AvlNode, _ viewed: AvlNode){
        if parent.left === viewed{
            parent.left = viewed.left ?? viewed.right
        }else{
            parent.right = viewed.left ?? viewed.right
        }
    }
    private func removeWithTwoChildren(_ parent : inout AvlNode, _ viewed: AvlNode){
        if viewed.left?.right == nil{
            let viewedright = viewed.right
            if parent.left === viewed{
                parent.left = viewed.left
            }else{
                parent.right = viewed.left
            }
            viewed.left?.right = viewedright
        }else{
            var tparemt : AvlNode? = parent
            var tviewed : AvlNode? = viewed
            while tviewed?.left?.right != nil{
                tparemt = tviewed?.left
                tviewed = tviewed?.left?.right
            }
            tparemt?.right = tviewed?.left
            let viewedleft = viewed.left
            let viewedright = viewed.right
            if parent.left === viewed{
                parent.left = tviewed
            }else{
                parent.right = tviewed
            }
            tviewed?.right = viewedright
            tviewed?.left = viewedleft
        }
    }

    //Balance block
    
    func rotateright(_ root : AvlNode) -> AvlNode{
        guard let newroot = root.left else {
            return root
        }
        root.left = newroot.right
        newroot.right = root
        return newroot
    }
    
    func rotateleft(_ root : AvlNode) -> AvlNode{
        guard let newroot = root.right else {
            return root
        }
        root.right = newroot.left;
        newroot.left = root;
        return newroot;
    }
    
    private func balance(_ node : AvlNode) -> AvlNode{
        if(node.bfactor == 2){
            if let factor = node.right?.bfactor, factor == -1 {
                 node.right = rotateright(node.right!);
            }
            return rotateleft(node);
        }
        if(node.bfactor == -2){
            if let factor = node.left?.bfactor, factor == 1{
                 node.left = rotateleft(node.left!);
            }
            return rotateright(node);
        }
        return node;
    }
    
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
}




