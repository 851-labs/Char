//
//  VirtualKeyboard+Extension.swift
//  char
//
//  Created by Alexandru Turcanu on 10/12/25.
//

import SwiftUI

// MARK: - Environment Value

extension EnvironmentValues {
  @Entry var isVirtualKeyboardVisible: Bool = false
}

// MARK: - Modifier

struct TrackVirtualKeyboard: ViewModifier {
  @State private var isKeyboardVisible: Bool = false

  func body(content: Content) -> some View {
    content
      .environment(\.isVirtualKeyboardVisible, isKeyboardVisible)
      #if !os(macOS)
      .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
        withAnimation {
          isKeyboardVisible = true
        }
      }
      .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
        withAnimation {
          isKeyboardVisible = false
        }
      }
      #endif
  }
}

// MARK: - View Extension

extension View {
  func trackVirtualKeyboard() -> some View {
    modifier(TrackVirtualKeyboard())
  }
}

