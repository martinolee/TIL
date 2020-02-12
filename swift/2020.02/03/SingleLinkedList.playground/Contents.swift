import UIKit

protocol LinkedListStack {
  var size: Int { get }     // 전체 개수
  var isEmpty: Bool { get } // 노드가 있는지 여부
  func push(node: Node)     // 데이터 삽입
  func pop() -> String?     // 데이터 추출
  func peek() -> String?    // 마지막 데이터 확인
}

final class Node {
  var value: String
  var link: Node?
  
  init(value: String) {
    self.value = value
  }
}

final class SingleLinkedList: LinkedListStack {
  
  private var head: Node = Node(value: "head")
  
  private var lastNode: Node? {
    guard var node = head.link else { return nil }
    while let linkedNode = node.link {
      node = linkedNode
    }
    return node
  }
  
  var size: Int {
    var count = 0
    
    guard var node = head.link else { return count }
    while let linkedNode = node.link {
      count += 1
      node = linkedNode
    }
    return count
  }
  
  var isEmpty: Bool { head.link == nil }
  
  func push(node newNode: Node) {
    guard let node = lastNode else { return head.link = newNode }
    
    node.link = newNode
  }
  
  func pop() -> String? {
    guard var node = head.link else { return nil }
    
    while let nextNode = node.link {
      guard nextNode.link != nil else {
        node.link = nil
        return nextNode.value
      }
      node = nextNode
    }
    
    head.link = nil
    
    return node.value
  }
  
  func peek() -> String? {
    lastNode?.value
  }
  
}

var singleLinkedList = SingleLinkedList()


singleLinkedList.push(node: Node(value: "A"))
singleLinkedList.push(node: Node(value: "B"))
singleLinkedList.push(node: Node(value: "C"))
singleLinkedList.push(node: Node(value: "D"))
singleLinkedList.push(node: Node(value: "E"))

singleLinkedList.pop()
singleLinkedList.pop()
singleLinkedList.pop()
singleLinkedList.pop()
singleLinkedList.pop()
singleLinkedList.pop()
