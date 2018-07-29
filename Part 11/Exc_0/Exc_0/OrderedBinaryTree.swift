//
//  OrderedTree.swift
//  Exc_0
//
//  Created by Lsgsk on 24.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class OrderedBinaryTree : CustomStringConvertible {
    private var root : BinaryNode?
    init() {
    }
    
    func addNode(_ newValue: Int){
        if let root = self.root{
            addNode(root, newValue)
        }
        else{
            root = BinaryNode(newValue)
        }
    }
    
    private func addNode(_ root : BinaryNode, _ newValue: Int){
        if newValue < root.value{
            if let left = root.leftChild{
                addNode(left, newValue)
            }else{
                root.leftChild = BinaryNode(newValue)
            }
        }else{
            if let right = root.rightChild{
                addNode(right, newValue)
            }else{
                root.rightChild = BinaryNode(newValue)
            }
        }
    }
    func findNode(_ target: Int) -> BinaryNode?{
        return findNode(self.root, target)
    }
    
    private func findNode(_ root : BinaryNode?, _ target: Int) -> BinaryNode?{
        if let root = root{
            if target == root.value{
                return root
            }else if target < root.value{
                return findNode(root.leftChild, target)
            }else{
                return findNode(root.rightChild, target)
            }
        }
        else{
            return nil
        }
    }
    
    func removeNode(_ target: Int){
        removeNode(nil, self.root, target)
    }
    
    private func removeNode(_ parent : BinaryNode?, _ viewed : BinaryNode?, _ target: Int){
        if let viewed = viewed{
            if target == viewed.value{
                if viewed.leftChild == nil && viewed.rightChild == nil{
                    if parent == nil{
                        removeRoot()
                    } else{
                        removeTerminalLeaf(parent, viewed)
                    }
                } else if viewed.leftChild == nil || viewed.rightChild == nil{
                    if parent == nil{
                        removeRootOneChildLeaf(viewed)
                    } else{
                        removeOneChildLeaf(parent, viewed)
                    }
                }
                else{
                    if parent == nil{
                        
                    }else{
                        if viewed.leftChild?.rightChild == nil{
                            let viewedright = viewed.rightChild
                            if parent?.leftChild === viewed{
                                parent?.leftChild = viewed.leftChild
                            }else{
                                parent?.rightChild = viewed.leftChild
                            }
                            viewed.leftChild?.rightChild = viewedright
                        }else{
                            var tparemt : BinaryNode? = parent
                            var tviewed : BinaryNode? = viewed
                            while tviewed?.leftChild?.rightChild != nil{
                                tparemt = tviewed?.leftChild
                                tviewed = tviewed?.leftChild?.rightChild
                            }
                            tparemt?.rightChild = tviewed?.leftChild
                            let viewedleft = viewed.leftChild
                            let viewedright = viewed.rightChild
                            if parent?.leftChild === viewed{
                                parent?.leftChild = tviewed
                            }else{
                                parent?.rightChild = tviewed
                            }
                            tviewed?.rightChild = viewedright
                            tviewed?.leftChild = viewedleft
                        }
                    }
                }
            }else if target < viewed.value{
                return removeNode(viewed, viewed.leftChild, target)
            }else{
                return removeNode(viewed, viewed.rightChild, target)
            }
        }
    }
    private func removeRoot(){
        self.root = nil
    }
    
    private func removeTerminalLeaf(_ parent : BinaryNode?, _ viewed: BinaryNode?){
        if parent?.leftChild === viewed{
            parent?.leftChild = nil
        }else{
            parent?.rightChild = nil
        }
    }
    private func removeOneChildLeaf(_ parent : BinaryNode?, _ viewed: BinaryNode?){
        if parent?.leftChild === viewed{
            parent?.leftChild = viewed?.leftChild ?? viewed?.rightChild
        }else{
            parent?.rightChild = viewed?.leftChild ?? viewed?.rightChild
        }
    }
    
    private func removeRootOneChildLeaf(_ viewed: BinaryNode?){
        root = viewed?.leftChild ?? viewed?.rightChild
    }
    
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
    
    func traverseInorder(_ node: BinaryNode){
        if let left = node.leftChild{
            traverseInorder(left)
        }
        print(node.value,terminator:" ")
        if let rigth = node.rightChild{
            traverseInorder(rigth)
        }
    }
}

class BinaryNode : CustomStringConvertible{
    var description: String{
        return "BinaryNode. Value:\(value)"
    }
    
    var value : Int
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    init(_ value: Int) {
        self.value = value
    }
}

extension BinaryNode
{
    var asString:String { return treeString(self){("\($0.value)",$0.leftChild,$0.rightChild)}  }
    
    private func treeString<T>(_ node:T, reversed:Bool=false, isTop:Bool=true, using nodeInfo:(T)->(String,T?,T?)) -> String
    {
        // node value string and sub nodes
        let (stringValue, leftNode, rightNode) = nodeInfo(node)
        
        let stringValueWidth  = stringValue.count
        
        // recurse to sub nodes to obtain line blocks on left and right
        let leftTextBlock     = leftNode  == nil ? []
            : treeString(leftNode!,reversed:reversed,isTop:false,using:nodeInfo)
                .components(separatedBy:"\n")
        
        let rightTextBlock    = rightNode == nil ? []
            : treeString(rightNode!,reversed:reversed,isTop:false,using:nodeInfo)
                .components(separatedBy:"\n")
        
        // count common and maximum number of sub node lines
        let commonLines       = min(leftTextBlock.count,rightTextBlock.count)
        let subLevelLines     = max(rightTextBlock.count,leftTextBlock.count)
        
        // extend lines on shallower side to get same number of lines on both sides
        let leftSubLines      = leftTextBlock
            + Array(repeating:"", count: subLevelLines-leftTextBlock.count)
        let rightSubLines     = rightTextBlock
            + Array(repeating:"", count: subLevelLines-rightTextBlock.count)
        
        // compute location of value or link bar for all left and right sub nodes
        //   * left node's value ends at line's width
        //   * right node's value starts after initial spaces
        let leftLineWidths    = leftSubLines.map{$0.count}
        let rightLineIndents  = rightSubLines.map{$0.prefix{$0==" "}.count  }
        
        // top line value locations, will be used to determine position of current node & link bars
        let firstLeftWidth    = leftLineWidths.first   ?? 0
        let firstRightIndent  = rightLineIndents.first ?? 0
        
        
        // width of sub node link under node value (i.e. with slashes if any)
        // aims to center link bars under the value if value is wide enough
        //
        // ValueLine:    v     vv    vvvvvv   vvvvv
        // LinkLine:    / \   /  \    /  \     / \
        //
        let linkSpacing       = min(stringValueWidth, 2 - stringValueWidth % 2)
        let leftLinkBar       = leftNode  == nil ? 0 : 1
        let rightLinkBar      = rightNode == nil ? 0 : 1
        let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
        let valueOffset       = (stringValueWidth - linkSpacing) / 2
        
        // find optimal position for right side top node
        //   * must allow room for link bars above and between left and right top nodes
        //   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
        //   * can be offset to the left if lower subNodes of right node
        //     have no overlap with subNodes of left node
        let minSpacing        = 2
        let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
            .reduce(firstLeftWidth + minLinkWidth)
            { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }
        
        
        // extend basic link bars (slashes) with underlines to reach left and right
        // top nodes.
        //
        //        vvvvv
        //       __/ \__
        //      L       R
        //
        let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
        let rightLinkExtra    = linkExtraWidth / 2
        let leftLinkExtra     = linkExtraWidth - rightLinkExtra
        
        // build value line taking into account left indent and link bar extension (on left side)
        let valueIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
        let valueLine         = String(repeating:" ", count:max(0,valueIndent))
            + stringValue
        let slash             = reversed ? "\\" : "/"
        let backSlash         = reversed ? "/"  : "\\"
        let uLine             = reversed ? "¯"  : "_"
        // build left side of link line
        let leftLink          = leftNode == nil ? ""
            : String(repeating: " ", count:firstLeftWidth)
            + String(repeating: uLine, count:leftLinkExtra)
            + slash
        
        // build right side of link line (includes blank spaces under top node value)
        let rightLinkOffset   = linkSpacing + valueOffset * (1 - leftLinkBar)
        let rightLink         = rightNode == nil ? ""
            : String(repeating:  " ", count:rightLinkOffset)
            + backSlash
            + String(repeating:  uLine, count:rightLinkExtra)
        
        // full link line (will be empty if there are no sub nodes)
        let linkLine          = leftLink + rightLink
        
        // will need to offset left side lines if right side sub nodes extend beyond left margin
        // can happen if left subtree is shorter (in height) than right side subtree
        let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
        let leftIndent        = String(repeating:" ", count:leftIndentWidth)
        let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }
        
        // compute distance between left and right sublines based on their value position
        // can be negative if leading spaces need to be removed from right side
        let mergeOffsets      = indentedLeftLines
            .map{$0.count}
            .map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
            .enumerated()
            .map{ rightSubLines[$0].isEmpty ? 0  : $1 }
        
        
        // combine left and right lines using computed offsets
        //   * indented left sub lines
        //   * spaces between left and right lines
        //   * right sub line with extra leading blanks removed.
        let mergedSubLines    = zip(mergeOffsets.enumerated(),indentedLeftLines)
            .map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
            .map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }
        
        // Assemble final result combining
        //  * node value string
        //  * link line (if any)
        //  * merged lines from left and right sub trees (if any)
        let treeLines = [leftIndent + valueLine]
            + (linkLine.isEmpty ? [] : [leftIndent + linkLine])
            + mergedSubLines
        
        return (reversed && isTop ? treeLines.reversed(): treeLines)
            .joined(separator:"\n")
    }
}
