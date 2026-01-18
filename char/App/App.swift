//
//  charApp.swift
//  char
//
//  Created by Alexandru Turcanu on 10/12/25.
//

import Sparkle
import SwiftUI

private enum UpdateFeed {
  static let url = "https://github.com/851-labs/char/releases/latest/download/appcast.xml"
}

private final class UpdaterDelegate: NSObject, SPUUpdaterDelegate {
  func feedURLString(for updater: SPUUpdater) -> String? {
    UpdateFeed.url
  }
}

@main
struct charApp: App {
  private let updaterController = SPUStandardUpdaterController(
    startingUpdater: true,
    updaterDelegate: UpdaterDelegate(),
    userDriverDelegate: nil
  )

  var body: some Scene {
    WindowGroup {
      ContentView()
        .trackVirtualKeyboard()
    }
    .commands {
      InspectorCommands()
      CommandGroup(after: .appInfo) {
        Button {
          updaterController.checkForUpdates(nil)
        } label: {
          Label("Check for Updates…", systemImage: "square.and.arrow.down")
        }
      }
    }
  }
}
