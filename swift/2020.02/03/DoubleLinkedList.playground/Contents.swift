import Foundation

/*
class Node { }
- deinit 메서드 구현할 것
class DoubleLinkedList { }
- 다음의 프로퍼티와 메서드 구현
 [ 프로퍼티 ]
 // private
 private var head: Node?
 private weak var tail: Node?
 // internal
 var isEmpty: Bool - 노드 존재 여부
 var count: Int    - 노드 전체 개수
 var first: Node?  - 첫번째 노드 반환
 var last: Node?   - 마지막 노드 반환
 
 [ 메서드 ]
 scanValues()  - 현재 저장된 모든 노드의 값 출력
 removeAll()   - 모든 노드 제거
 removeNode(by value: String) -> Bool      - 밸류를 이용해 노드 제거 후 성공 여부
 removeNode(at index: Int) -> String?      - 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
 node(by value: String) -> Node?           - 지정한 값을 지닌 노드를 찾아 반환
 insert(node newNode: Node, at index: Int) - 특정 위치에 노드 삽입
 append(node: Node)                        - 마지막 부분에 노드 삽입
 */

class Node {
  var value: String
  var previous: Node?
  var next: Node?
  
  init(value: String) {
    self.value = value
  }
  
  deinit {
    print("Node just deinited")
  }
}

class DoubleLinkedList {
  private var head = Node(value: "head")
  private var tail = Node(value: "tail")
  
  var first: Node? { head.next }
  var last: Node? { tail.previous }
  
  var isEmpty: Bool { head.next == nil }
  
  var count: Int {
    0
  }
  
  func scanValues() {
    
  }
  
  func removeAll() {
    
  }
  
  func removeNode(by value: String) -> Bool {
    
  }
  
  func removeNode(at index: Int) -> String? {
    
  }
  
  func node(by value: String) -> Node? {
    
  }
  
  func insert(node newNode: Node, at index: Int) {
    
  }
  
  func append(node: Node) {
    
    6 
  }
}

var doubleLinkedList = DoubleLinkedList()
