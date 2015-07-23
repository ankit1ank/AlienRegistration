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



if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
{
    let dir = dirs[0]
    let path = dir.stringByAppendingPathComponent("alien.txt")
        
    println("Writing to text file.")
        
        
        
    //Write to file -- Pitfall: Writing to file can fail
    text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: nil)
    println("Output written to text file. Check your documents directory for file named alien.txt")
        
}