//
//  BinaryTree.swift
//  SwiftAlgorithm
//
//  Created by subash on 2/24/20.
//  Copyright © 2020 symbolicTrace. All rights reserved.
//

import Foundation

class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Element?) -> Void) {
        visit(value)
        if let leftChild = leftChild { leftChild.traversePreOrder(visit: visit) }
        else { visit(nil) }
        if let rightChild = rightChild { rightChild.traversePreOrder(visit: visit) }
        else { visit(nil) }
       }
    
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    func serialize() -> [Element?] {
        var array: [Element?] = []
        self.traversePreOrder { array.append($0)}
        return array
    }
    
}

class Tree {
    
    static func deserialize<Element>(_ array: inout [Element?]) -> BinaryNode<Element>? {
        guard let value = array.removeLast() else {
            return nil
        }
        let node = BinaryNode(value: value)
        node.leftChild = deserialize(&array)
        node.rightChild = deserialize(&array)
        return node
      }

    static func deserialize<Element>(_ array: [Element?]) -> BinaryNode<Element>? {
        var reversed = Array(array.reversed())
        return deserialize(&reversed)
    }
    
}

