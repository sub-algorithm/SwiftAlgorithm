//
//  BinaryTreeTestCase.swift
//  SwiftAlgorithmTests
//
//  Created by subash on 2/24/20.
//  Copyright © 2020 symbolicTrace. All rights reserved.
//

import XCTest

class BinaryTreeTestCase: XCTestCase {
      
    var tree: BinaryNode<Int> = {
        let seven = BinaryNode(value: 7)
        let one = BinaryNode(value: 1)
        let nine = BinaryNode(value: 9)
        let zero = BinaryNode(value: 0)
        let five = BinaryNode(value: 5)
        let eight = BinaryNode(value: 8)
        
        seven.leftChild = one
        seven.rightChild = nine
        one.leftChild = zero
        one.rightChild = five
        nine.leftChild = eight
        
        return seven
    }()
    
    func test_visualizeBinaryTree() {
        print(tree.description)
    }
    
    func test_traverseInOrder() {
        var testArray: [Int] = []
        tree.traverseInOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [0,1, 5,7,8,9])
    }
    
    func test_traversePreOrder() {
          var testArray: [Int?] = []
          tree.traversePreOrder { testArray.append($0) }
          XCTAssertEqual(testArray, [7,1,0,5,9,8])
      }
    
    func test_traversePostOrder() {
        var testArray: [Int] = []
        tree.traversePostOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [0,5,1,8,9,7])
    }
    
    func testSerializationDeserialization() {
        let expectedArray = [7,1,0,nil,nil,5,nil,nil,9,8,nil,nil,nil]
        let serializedTree = tree.serialize()
        XCTAssertEqual(expectedArray, serializedTree)
        let deserialzedArray = Tree.deserialize(serializedTree)
        XCTAssertEqual(deserialzedArray?.description, tree.description)
    }

}
