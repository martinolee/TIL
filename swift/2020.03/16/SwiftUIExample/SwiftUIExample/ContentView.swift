//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Soohan Lee on 2020/03/16.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit
import SwiftUI

protocol someType {}

protocol Human {
  associatedtype Body: someType
}

struct TextView: View {
  
  var body: some View {
    VStack {
      Text("SwiftUI")
        .font(.title)
        .bold()
        .padding()
      
      Text("SwiftUI")
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
      
      Text("Custom Font, Bold, Italic, Underline, Strickthrough")
        .font(.custom("Menlo", size: 16))
        .bold()
        .italic()
        .underline()
        .strikethrough()
      
      
      Text("Line Limit\n and \nText Alignment. \nCannot see this")
        .lineLimit(2)
        .multilineTextAlignment(.trailing)
      
      (Text("자간과 기준선").kerning(8)
        + Text(" 조정도 쉽게 가능합니다").baselineOffset(-15))
        .font(.system(size: 20))
    }
  }
}

struct ImageView: View {
  
  var body: some View {
    VStack(spacing: 30) {
      Image("SwiftUI")
      
      Image("SwiftUI")
        .resizable()
        .frame(width: 50, height: 50)
      
      Image("SwiftUI")
        .resizable()
        .frame(width: 100, height: 100)
        .clipShape(
          Rectangle().inset(by: 0)
      )
        .clipShape(Circle())
      
      Image(systemName: "bookmark")
        .resizable()
        .renderingMode(.template)
        .font(.largeTitle)
        .foregroundColor(.blue)
        .scaledToFit()
    }
  }
}

struct StackView: View {
  
  var body: some View {
    HStack(alignment: .top) {
      Text("HStack")
        .font(.title)
        .foregroundColor(Color.blue)
      Text("in array")
      Text("!")
    }
    .padding()
    .border(Color.black)
    .font(.largeTitle)
  }
}

struct ZStackView: View {
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(Color.red)
        .frame(width: 150, height: 150)
        .offset(x: -40, y: -40)
        .zIndex(-10)
      
      Rectangle()
        .fill(Color.green)
        .frame(width: 150, height: 150)
        .offset(x: -30, y: -30)
        .zIndex(-5)
    }
  }
}

struct SpacerView: View {
  
  var body: some View {
    VStack {
      Text("제목")
        .font(.largeTitle)
      
      Text("부제목")
        .foregroundColor(.gray)
      
      Spacer()
      
      Text("본문 내용")
      
      Spacer()
      Spacer()
      
      Text("각주")
        .font(.body)
    }
    .font(.title)
    .frame(width: 200, height: 350)
    .padding()
    .border(Color.blue, width: 2)
  }
}

struct ListView: View {
  
  var body: some View {
//    List(1...100) {
//      MyCell(someNumber: $0)
//    }
    Text("")
  }
}

struct MyCell: View {
  var someNumber: Int
  
  var body: some View {
    VStack {
      Image("SwiftUI")
      Text("SwiftUI \(someNumber)")
    }
  }
}

struct ButtonView: View {
  @State var count = 0
  
  var body: some View {
    print("Count up \(count)")
    return VStack(spacing: 30) {
      Text("\(count)")
      
      Button(action: {
        self.count += 1
      }) {
        Text("This is a Button")
          .padding(50)
          .background(Color.orange)
          .foregroundColor(.black)
      }
    }
  }
}

struct NaviView: View {
  
  var body: some View {
    NavigationView {
      VStack(spacing: 30) {
        NavigationLink(destination: Text("Haha")) {
          Image("SwiftUI")
        }
        .buttonStyle(PlainButtonStyle())
        
        Text("Hello, World!")
        
        Text("Apple")
        
        Text("Steve Jobs")
        
        Button("Go") {
          
        }
      }
    }
    .font(.largeTitle)
    .navigationBarTitle("SwiftUI")
    .navigationBarItems(trailing: Image(systemName: "bookmark.fill"))
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NaviView()
  }
}
