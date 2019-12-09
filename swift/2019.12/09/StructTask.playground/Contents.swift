import UIKit

struct User {
    var friends: [Friends] = []
    var blocks: [Friends] = []
}

struct Friends: Equatable {
    let name: String
}

/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */

struct FriendList {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    mutating func addFriend(name: String) -> User {
        // 호출 시 해당 이름의 친구를 friends 배열에 추가
        
        user.friends.append(Friends(name: name))
        
        return user
    }
    
    mutating func blockFriend(name: String) -> User {
        // 호출 시 해당 이름의 친구를 blocks 배열에 추가
        // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
        let block = Friends(name: name)
        user.blocks.append(block)
        
        user.friends = user.friends.filter { $0 != block }
        
        return user
    }
}

var user = User()

var friendList = FriendList(user: user)
user = friendList.addFriend(name: "원빈")
user = friendList.addFriend(name: "장동건")
user = friendList.addFriend(name: "정우성")
user.friends   // 원빈, 장동건, 정우성

user = friendList.blockFriend(name: "정우성")
user.friends   // 원빈, 장동건
user.blocks    // 정우성

print(type(of: user))
