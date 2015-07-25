import Foundation

public struct Alien {
    var codeName: String
    var bloodColor: String
    var numberOfAntennas: String
    var numberOfLegs: String
    var homePlanet: String
    
    var text: String {
        get {
            return "Alien details\n\nCode Name: \(self.codeName)" + "Blood Color: \(self.bloodColor)" + "Number of antennas: \(self.numberOfAntennas)" + "Number of Legs: \(self.numberOfLegs)" + "Home planet: \(self.homePlanet)"
        }
    }
    
    init(codeName: String, bloodColor: String, numberOfAntennas: String, numberOfLegs: String, homePlanet: String) {
        self.codeName = codeName
        self.bloodColor = bloodColor
        self.numberOfAntennas = numberOfAntennas
        self.numberOfLegs = numberOfLegs
        self.homePlanet = homePlanet
    }
}

// Function to accept input from console
public func getInput() -> String {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    return (NSString(data: inputData, encoding:NSUTF8StringEncoding)! as! String)
}

var alienArray: [Alien] = []
var nextAlien = true

// Get input from user
println("Welcome alien.")
println("Please enter your details.")

do {
    // Pitfall: Error checking for input
    
    println("Code Name: ")
    let codeName = getInput()
    
    println("Blood Color: ")
    let bloodColor = getInput()
    
    println("Number of antennas: ")
    let numberOfAntennas = getInput()
    
    println("Number of legs: ")
    let numberOfLegs = getInput()
    
    println("Home planet: ")
    let homePlanet = getInput()
    
    var alien = Alien(codeName: codeName, bloodColor: bloodColor, numberOfAntennas: numberOfAntennas, numberOfLegs: numberOfLegs, homePlanet: homePlanet)
    
    alienArray.append(alien)
    
    println("Enter details of next alien? (y or n)")
    var answer = getInput()
    if answer != "y\n" {
        nextAlien = false
    }
    
} while nextAlien

println("Do you wish to save the details entered?(y or n)")
var answer = getInput()
if answer == "y\n" {
    selectFormat()
} else {
    alienArray = []
}