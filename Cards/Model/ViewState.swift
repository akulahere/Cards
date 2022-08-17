//
//  ViewState.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

class ViewState: ObservableObject {
  var selectedCard: Card?
  @Published var showAllCards = true {
    didSet {
      if showAllCards {
        selectedCard = nil
      }
    }
  }
  convenience init(card: Card) {
    self.init()
    showAllCards = false
    selectedCard = card
  }


}
