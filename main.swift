import Foundation

// Function to accept input from console
func input() -> NSString {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    return NSString(data: inputData, encoding:NSUTF8StringEncoding)!
    
}

// Get input from user
println("Welcome alien.")
println("Please enter your details.")

// Pitfall: Error checking for input
println("Code Name: ")
var codeName = input() as! String

println("Blood Color: ")
var bloodColor = input() as! String

println("Number of antennas: ")
var numberOfAntennas = input() as! String

println("Number of legs: ")
var numberOfLegs = input() as! String

println("Home planet: ")
var homePlanet = input() as! String

let text = "Alien details\n\nCode Name: \(codeName)" +
    "Blood Color: \(bloodColor)" +
    "Number of antennas: \(numberOfAntennas)" +
    "Number of Legs: \(numberOfLegs)" +
    "Home planet: \(homePlanet)"


