// 4. დააგენერირეთ ანბანის მასივის შემთხვევითი წევრებისგან 30 წევრიანი მასივი სადაც არ იქნება შემდეგი ასოები: - D, E, და Q და დააბრუნეთ true თუ მასივი შეიცავს C-ს.

let alphabet: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
let arraySize = 30

// Generating random character array
// ----------------------------------------------------------
let randomAlphabetsArray = (0..<arraySize).map { _ -> Character in
    var elem: Character
    // Generate 30-long-sized array which doesn't have "D", "E", or "Q" in it
    repeat {
        elem = alphabet.randomElement()!
        if !["D", "E", "Q"].contains(elem) { break }
    } while true
    return elem
}
// ----------------------------------------------------------

// Maybe you mean to use filter and I wasn't able to understand
// it from the description :/
// Anyways, here's how HoF would solve it
/*
 1. Declate randomAlphabetsArray as a variable, not a constant
 2. Put all 30 random chars into it
 3. randomAlphabetsArray = randomAlphabetsArray.filter { !["D", "E", "Q"].contains($0) }
 */

// Checking if "C" is present in our array
print(randomAlphabetsArray.contains { $0 == "C" })
