//
//  Clipboard.swift
//  char
//
//  Created by Alexandru Turcanu on 10/12/25.
//

import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

enum Clipboard {
  static func copy(_ string: String) {
    #if os(macOS)
    NSPasteboard.general.clearContents()
    NSPasteboard.general.setString(string, forType: .string)
    #else
    UIPasteboard.general.string = string
    #endif
  }
  
  static func paste() -> String? {
    #if os(macOS)
    return NSPasteboard.general.string(forType: .string)
    #else
    return UIPasteboard.general.string
    #endif
  }
}

