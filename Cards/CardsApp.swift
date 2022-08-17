//
//  CardsApp.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

@main
struct CardsApp: App {
  @StateObject var viewState = ViewState()
  @StateObject var store = CardStore(defaultData: true)

  var body: some Scene {
    WindowGroup {
      CardsView()
        .environmentObject(viewState)
        .environmentObject(store)

    }
  }
}
