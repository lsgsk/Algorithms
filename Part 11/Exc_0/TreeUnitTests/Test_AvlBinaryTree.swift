import XCTest
import Cocoa

class Test_AvlBinaryTree: XCTestCase {
    func test_adding() {
        let avl = AvlBinaryTree()
        avl.addNode(4)
        avl.addNode(5)
        avl.addNode(7)
        avl.addNode(2)
        avl.addNode(1)
        avl.addNode(3)
        avl.addNode(6)
        XCTAssertEqual(avl.traverseValuesInOrder(), "1 2 3 4 5 6 7")
        XCTAssertEqual(avl.traverseDepthInOrder(), "2 1 2 0 2 1 2")
        print(avl)
    }
    func test_removing() {
        let avl = AvlBinaryTree()
        avl.addNode(5);
        avl.addNode(3);avl.addNode(8);
        avl.addNode(2);avl.addNode(4);avl.addNode(7);avl.addNode(10);
        avl.addNode(1);avl.addNode(6);avl.addNode(9);avl.addNode(11)
        avl.removeNode(4)
        avl.removeNode(8)
        avl.removeNode(6)
        avl.removeNode(5)
        avl.removeNode(2)
        avl.removeNode(1)
        avl.removeNode(7)
        XCTAssertEqual(avl.traverseValuesInOrder(), "3 9 10 11")
        XCTAssertEqual(avl.traverseDepthInOrder(), "1 2 0 1")
        print(avl)
    }
}
