//
//  String+Extension.swift
//  char
//
//  Created by Alexandru Turcanu on 10/12/25.
//

import Foundation

extension String {
  var wordCount: Int {
    let words = components(separatedBy: .whitespacesAndNewlines)
    return words.filter { !$0.isEmpty }.count
  }
  
  var characterCount: Int {
    return count
  }
  
  var sentenceCount: Int {
    let sentenceEndings = CharacterSet(charactersIn: ".!?")
    let sentences = unicodeScalars.split { sentenceEndings.contains($0) }
    return sentences.filter { !$0.allSatisfy { CharacterSet.whitespacesAndNewlines.contains($0) } }.count
  }
  
  var paragraphCount: Int {
    let paragraphs = components(separatedBy: .newlines)
    return paragraphs.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }.count
  }
  
  var readingTime: String {
    // Average reading speed: ~238 words per minute
    let seconds = Double(wordCount) / 238.0 * 60.0
    return formatTime(seconds)
  }
  
  var speakingTime: String {
    // Average speaking speed: ~150 words per minute
    let seconds = Double(wordCount) / 150.0 * 60.0
    return formatTime(seconds)
  }
  
  private func formatTime(_ totalSeconds: Double) -> String {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .abbreviated
    
    if totalSeconds >= 60 {
      formatter.allowedUnits = [.minute, .second]
    } else {
      formatter.allowedUnits = [.second]
    }
    
    return formatter.string(from: totalSeconds) ?? ""
  }
}

