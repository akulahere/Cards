//
//  ViewExtensions.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

extension View {
  func resizableView() -> some View {
    return modifier(ResizableView())
  }
}
