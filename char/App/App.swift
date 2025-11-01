//
//  charApp.swift
//  char
//
//  Created by Alexandru Turcanu on 10/12/25.
//

import SwiftUI

@main
struct charApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .trackVirtualKeyboard()
    }
    .commands {
      InspectorCommands()
    }
  }
}
