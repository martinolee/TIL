import Foundation

class Animal {
    var brain = true
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Human: Animal {
    override init(legs: Int) {
        super.init(legs: legs)
    }
}

class Pet: Animal {
    var fleas: Int
    
    init(fleas: Int) {
        self.fleas = fleas
        super.init(legs: 4)
    }
}

class Dog: Pet {
    override init(fleas: Int) {
        super.init(fleas: fleas)
    }
}

class Cat: Pet {
    override init(fleas: Int) {
        super.init(fleas: fleas)
    }
}

let animal = Animal(legs: 0)
animal.brain
animal.legs

let human = Human(legs: 2)
human.brain
human.legs

let pet = Pet(fleas: 0)
pet.brain
pet.legs
pet.fleas

let dog = Dog(fleas: 8)
dog.brain
dog.legs
dog.fleas

let cat = Cat(fleas: 4)
cat.brain
cat.legs
cat.fleas
