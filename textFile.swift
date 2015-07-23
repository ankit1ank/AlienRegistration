
if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
{
    let dir = dirs[0]
    let path = dir.stringByAppendingPathComponent("alien.txt")
        
    println("Writing to text file.")
        
        
        
    //Write to file -- Pitfall: Writing to file can fail
    text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: nil)
    println("Output written to text file. Check your documents directory for file named alien.txt")
        
}