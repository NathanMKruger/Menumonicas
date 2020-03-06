// WordList.swift
// Created for Assignment 5 of CSI 380

import Foundation

// YOU FILL IN HERE
// You'll want to create a mechanism here for loading and querying
// words.txt. It's up to you how you do this. You may consider a struct.
struct Word {
    //var wordList: [String] = []
    var wordList : [String]// = tempWords.components(separatedBy: "\n")

   mutating func loadWords() {
      let fileManager = FileManager.default
      var path = fileManager.currentDirectoryPath
      path = path.replacingOccurrences(of: "DerivedData/PhoneNumberMnemonics/Build/Products/Debug", with: "")//climb up directory
      print("PATH:",path)

        do {
            let tempWords = try String(contentsOfFile: path+"words.txt")
         self.wordList = tempWords.components(separatedBy: "\n")
        }   catch {
            print(error)
        }
    }
}
