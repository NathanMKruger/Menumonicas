// WordSearch.swift
// Created for Assignment 5 of CSI 380

import Foundation

// YOU FILL IN HERE
// Feel free to put in additional utility code as long as you have
// no loops, no *mutable* global variables, and no custom classes.

// Replaces each character in a phone number with an array of the
// possible letters that could be in place of that character
// For instance, 234 becomes [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"]]
public func letters(for phoneNumber: String) -> [[String]] {
   var numToLetters = [[String]]()
   let numArrayChars = Array(phoneNumber)
   let numArrayInts = numArrayChars.map{Int(String($0))}
   let letterRef = [["0"],["1"],["A","B","C"],["D","E","F"],["G","H","I"],["J","K","L"],["M","N","O"],["P","Q","R","S"],["T","U","V"],["W","X","Y","Z"]]
   numToLetters = numArrayInts.map{ letterRef[$0!] }
   
   return numToLetters
}

public func buildPerm(arrays: [[String]], tempPerm: String, index: Int)->String{
   
   var tempArrays = arrays
   var newPerm = tempArrays.removeFirst()
   var newTemp = tempPerm
   newTemp = newPerm[index]
   var newIndex = index + 1
   if(arrays.count != 0){
      var tempPerm = buildPerm(arrays: tempArrays, tempPerm: newPerm[0], index: newIndex)
   }
   return tempPerm
}

public func tryThis(arrays: [[String]], perms: [String], index: Int) ->[String]{
   var newPerms = perms
   var perm = String(arrays.flatMap{$0[index]})
   newPerms.append(perm)
   print("PERM UPDATE:  ", perm)
   var allPerms = tryThis(arrays: arrays, perms: newPerms, index: index+1)
   return allPerms
}

// Finds all of the ordered permutations of a given
// array of arrays of strings
// combining each choice in one
// array with each choice in the next array, and so on to produce strings
// For instance permuations(of: [["a", "b"], ["c"], ["d", "e"]]) will return
// ["acd", "ace", "bce", "bce"]
public func permutations(of arrays: [[String]]) -> [String] {
    //var allPerms = [[String]]()
    //[["a", "b"], ["c", "d"]]
   // should produce .. ["ac", "ad", "bc", "bd"]
    //total = array of arrays , inner = array of strings
   /*
   allPerms = arrays.reduce([]) { total, inner in
      var perm = [String]()
      print("total: ", total);
      
      return total + [inner].map{
         perm.append(String($0.flatMap{$0}))
         print("PERM:", perm)
         return perm
      }
   }
*/
   var allPerms = [String]()
   allPerms = arrays.reduce([]) { total, inner in
   var perm = ""
   print("total: ", total);
   var index = 0
    let newTotal = total + inner.flatMap{
      perm.append($0)
      print("PERM:", perm)
      index+=1
      return perm
   }
   return newTotal
   }
    return allPerms.flatMap{$0}
}
//CHUNKED: https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

// Finds all of the possible strings of characters that a phone number
// can potentially represent
// Uses letters(for:) and permutations(of:) to do this
public func possibles(for phoneNumber: String) -> [String] {
   var possibleStrings = [String]()
   possibleStrings = permutations(of: letters(for: phoneNumber)).map{
      String($0)
   }
   return possibleStrings
}

// Returns all of the words in a given *string* from the wordlist.txt file
// using only words in the word list of minimum length ofMinLength
public func wordsInString(_ string: String, ofMinLength length: UInt) -> [String] {
   var myWord = Word(wordList: [])
   myWord.loadWords()
   var validWords = myWord.wordList.filter{
      string.contains($0.uppercased()) && ($0.count >= length)
   }
   return validWords
}

// Returns all possibles strings of characters that a phone number
// can potentially represent that contain words in words.txt
// greater than or equal to ofMinLength characters
public func possiblesWithWholeWords(ofMinLength length: UInt, for phoneNumber: String) -> [String] {
    // YOU FILL IN HERE
   return["test"]
}

// Returns the phone number mnemonics that have the most words present in words.txt
// within them (note that these words could be overlapping)
// For instance, if there are two mnemonics that contain three words from
// words.txt, it will return both of them, if the are no other mnemonics
// that contain more than three words
public func mostWords(for phoneNumber: String) -> [String] {
    // YOU FILL IN HERE
    
   return["test"]
}

// Returns the phone number mnemonics with the longest words from words.txt
// If more than one word is tied for the longest, returns all of them
public func longestWords(for phoneNumber: String) -> [String] {
    let words = possiblesWithWholeWords(ofMinLength: 1, for: phoneNumber)
    _ = 0;
    _ = words.max(by: {$1.count > $0.count})
   
   //longestWords = possibles(for: phoneNumber)
    return words;
}
