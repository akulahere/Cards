//
//  CardsApp.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

@main
struct CardsApp: App {
  @StateObject var store = CardStore()
  @StateObject var viewState = ViewState()

  var body: some Scene {
    WindowGroup {
      CardsView()
        .environmentObject(viewState)
        .environmentObject(store)
        .onAppear {
          print(FileManager.documentURL ?? "")
        }


    }
  }
}



