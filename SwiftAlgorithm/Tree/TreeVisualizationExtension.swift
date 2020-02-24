//
//  TreeVisualizationExtension.swift
//  SwiftAlgorithm
//
//  Created by subash on 2/24/20.
//  Copyright © 2020 symbolicTrace. All rights reserved.
//

import Foundation

extension BinaryNode: CustomStringConvertible {
  
  public var description: String {
    return diagram(for: self)
  }
  
  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild,
                   top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild,
                bottom + "│ ", bottom + "└──", bottom + " ")
  }
}
