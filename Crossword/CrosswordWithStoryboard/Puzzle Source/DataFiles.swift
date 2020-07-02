//
//  DataFiles.swift
//  Crossword
//
//  Created by Kenneth An on 5/12/20.
//

import Foundation

public class DataFiles {
  
  /**
   Load the given file in the project's Data folder.
 
   - Parameter named: the name of the file to load.
   
   - Returns: The contents of the file as a String.  Fails with an assertion
     error if the file cannot be read.
  */
  public static func loadFile(named: String) -> String {
    let thisFileURL = URL(fileURLWithPath: #file) // url for the DataFiles.swft file

    // navigate from url up to the Data directory: "../../../Data"
    let baseURL = thisFileURL.deletingLastPathComponent().deletingLastPathComponent()
    let fileURL = baseURL.appendingPathComponent("Data", isDirectory: true).appendingPathComponent(named)
    
    do {
      return try String(contentsOf: fileURL)
    } catch let error  {
      assertionFailure(error.localizedDescription)
      return ""
    }
  }
  
}
