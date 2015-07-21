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


// Saves the file in documents directory with the filename alien.txt or alien.pdf
if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
{
    let dir = dirs[0]
    let path = dir.stringByAppendingPathComponent("alien.txt")
    let pdfPath = dir.stringByAppendingPathComponent("alien.pdf")
    
    println("Enter t for text file or any key for pdf: ")
    
    var outputFormat = input() as! String
    
    if outputFormat == "t\n" || outputFormat == "T\n" {
        
        println("Writing to text file.")
        
        let text = "Alien details\n\nCode Name: \(codeName)" +
            "Blood Color: \(bloodColor)" +
            "Number of antennas: \(numberOfAntennas)" +
            "Number of Legs: \(numberOfLegs)" +
            "Home planet: \(homePlanet)"
        
        //Write to file -- Pitfall: Writing to file can fail
        text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: nil)
        println("Output written to text file. Check your documents directory for file named alien.txt")
        
    } else {
        
        println("Writing to pdf file.")
        
        // Pitfall: Length attribute in pdf is set to 352.. pdf generation may fail for long inputs
        var pdfContent = "%PDF-1.4\n1 0 obj <</Type /Catalog /Pages 2 0 R>>\nendobj\n2 0 obj <</Type /Pages /Kids [3 0 R] /Count 1>>\nendobj\n3 0 obj<</Type /Page /Parent 2 0 R /Resources 4 0 R /MediaBox [0 0 500 800] /Contents 6 0 R>>\nendobj\n4 0 obj<</Font <</F1 5 0 R>>>>\nendobj\n5 0 obj<</Type /Font /Subtype /Type1 /BaseFont /Helvetica>>\nendobj\n6 0 obj\n<</Length 352>>\nstream\nBT /F1 24 Tf 20 700 Td (Alien Register)Tj ET\nBT /F1 24 Tf 20 650 Td (Code Name: \(codeName))Tj ET\nBT /F1 24 Tf 20 600 Td (Blood Color: \(bloodColor))Tj ET\nBT /F1 24 Tf 20 550 Td (Number of antennas: \(numberOfAntennas))Tj ET\nBT /F1 24 Tf 20 500 Td (Number of Legs: \(numberOfLegs))Tj ET\nBT /F1 24 Tf 20 450 Td (Home Planet: \(homePlanet))Tj ET\nendstream\nendobj\nxref\n0 7\n0000000000 65535 f\n0000000009 00000 n\n0000000056 00000 n\n0000000111 00000 n\n0000000212 00000 n\n0000000250 00000 n\n0000000317 00000 n\ntrailer <</Size 7/Root 1 0 R>>\nstartxref\n406\n%%EOF\n"
        
        // Write to pdf -- Pitfall: Writing to file can fail
        pdfContent.writeToFile(pdfPath, atomically: false, encoding: NSUTF8StringEncoding, error: nil)
        println("Output written to pdf. Check your documents directory for file named alien.pdf")
    }
    
}
