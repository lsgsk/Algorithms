import XCTest

class Test_OrderedBinaryTree: XCTestCase {
    
    func generateTree() -> OrderedBinaryTree
    {
        let tree = OrderedBinaryTree()
        tree.addNode(4);
        tree.addNode(2);tree.addNode(6);
        tree.addNode(1);tree.addNode(3);tree.addNode(5);
        return tree
    }
    
    func generateBigTree() -> OrderedBinaryTree
    {
        let tree = OrderedBinaryTree()
        tree.addNode(60)
        tree.addNode(35);tree.addNode(76)
        tree.addNode(21);tree.addNode(42);tree.addNode(68)
        tree.addNode(17);tree.addNode(24);tree.addNode(63);tree.addNode(69)
        tree.addNode(11);tree.addNode(23)
        return tree
    }
    
    func test_setUp() {
        let tree = generateTree()
        XCTAssertEqual(tree.traverseValuesInOrder(), "1 2 3 4 5 6")
        XCTAssertEqual(tree.traverseDepthInOrder(), "2 1 2 0 2 1")
        print(tree)
    }
    
    func test_addNode() {
        let tree = OrderedBinaryTree()
        tree.addNode(5);
        tree.addNode(3)
        tree.addNode(1)
        tree.addNode(7)
        tree.addNode(6)
        tree.addNode(0)
        XCTAssertEqual(tree.traverseValuesInOrder(), "0 1 3 5 6 7")
        XCTAssertEqual(tree.traverseDepthInOrder(), "3 2 1 0 2 1")
        print(tree)
    }
    func test_removeLeftTerminalNode() {
        let tree = generateTree()
        tree.removeNode(5)
        XCTAssertEqual(tree.traverseValuesInOrder(), "1 2 3 4 6")
        XCTAssertEqual(tree.traverseDepthInOrder(), "2 1 2 0 1")
        print(tree)
    }
    func test_removeRightTerminalNode() {
        let tree = generateTree()
        tree.removeNode(3)
        XCTAssertEqual(tree.traverseValuesInOrder(), "1 2 4 5 6")
        XCTAssertEqual(tree.traverseDepthInOrder(), "2 1 0 2 1")
        print(tree)
    }
    func test_removeLeftOneChildNode() {
        let tree = generateTree()
        tree.removeNode(6)
        XCTAssertEqual(tree.traverseValuesInOrder(), "1 2 3 4 5")
        XCTAssertEqual(tree.traverseDepthInOrder(), "2 1 2 0 1")
        print(tree)
    }
    func test_removeRightOneChildNode() {
        let tree = generateTree()
        tree.addNode(7)
        tree.addNode(8)
        tree.removeNode(7)
        XCTAssertEqual(tree.traverseValuesInOrder(), "1 2 3 4 5 6 8")
        XCTAssertEqual(tree.traverseDepthInOrder(), "2 1 2 0 2 1 2")
        print(tree)
    }
    
    func test_removeWithTwoChildNodeButWithoutRightChild() {
        let tree = generateBigTree()
        tree.removeNode(21)
        XCTAssertEqual(tree.traverseValuesInOrder(), "11 17 23 24 35 42 60 63 68 69 76")
        XCTAssertEqual(tree.traverseDepthInOrder(), "3 2 4 3 1 2 0 3 2 3 1")
        print(tree)
    }
    func test_removeWithTwoChildNodeButWitRightChild1() {
        let tree = generateBigTree()
        tree.removeNode(35)
        XCTAssertEqual(tree.traverseValuesInOrder(), "11 17 21 23 24 42 60 63 68 69 76")
        XCTAssertEqual(tree.traverseDepthInOrder(), "4 3 2 3 1 2 0 3 2 3 1")
        print(tree)
    }
    
    func test_removeWithTwoChildNodeButWitRightChild2() {
        let tree = generateBigTree()
        tree.removeNode(21)
        tree.removeNode(35)
        XCTAssertEqual(tree.traverseValuesInOrder(), "11 17 23 24 42 60 63 68 69 76")
        XCTAssertEqual(tree.traverseDepthInOrder(), "3 2 3 1 2 0 3 2 3 1")
        print(tree)
    }
    
    func test_removeWithTwoChildNodeButWitRightChild3() {
        let tree = generateBigTree()
        tree.removeNode(68)
        XCTAssertEqual(tree.traverseValuesInOrder(), "11 17 21 23 24 35 42 60 63 69 76")
        XCTAssertEqual(tree.traverseDepthInOrder(), "4 3 2 4 3 1 2 0 2 3 1")
        print(tree)
    }
    
    func test_removeEmptyRootNode() {
        let tree = OrderedBinaryTree()
        tree.removeNode(0)
        XCTAssertEqual(tree.traverseValuesInOrder(), "")
        XCTAssertEqual(tree.traverseDepthInOrder(), "")
        print(tree)
    }
    func test_removeAloneRootNode() {
        let tree = OrderedBinaryTree()
        tree.removeNode(5)
        tree.removeNode(5)
        XCTAssertEqual(tree.traverseValuesInOrder(), "")
        XCTAssertEqual(tree.traverseDepthInOrder(), "")
        print(tree)
    }
    
    func test_removeRootNodeWithRightChild() {
        let tree = generateTree()
        tree.removeNode(4)
        XCTAssertEqual(tree.traverseValuesInOrder(), "1 2 3 5 6")
        XCTAssertEqual(tree.traverseDepthInOrder(), "2 1 0 2 1")
        print(tree)
    }
    
    func test_removeRootNodeWithoutRightChild() {
        let tree = generateTree()
        tree.removeNode(4)
        tree.removeNode(3)
        XCTAssertEqual(tree.traverseValuesInOrder(), "1 2 5 6")
        XCTAssertEqual(tree.traverseDepthInOrder(), "1 0 2 1")
        print(tree)
    }
    
    func test_removeRootWithOneChild() {
        let tree = OrderedBinaryTree()
        tree.addNode(5);
        tree.addNode(6)
        tree.removeNode(5)
        XCTAssertEqual(tree.traverseValuesInOrder(), "6")
        XCTAssertEqual(tree.traverseDepthInOrder(), "0")
        print(tree)
    }
}
