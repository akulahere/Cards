//
//  CardStore.swift
//  Cards
//
//  Created by Dmytro Akulinin on 17.08.2022.
//

import SwiftUI

class CardStore: ObservableObject {
  @Published var cards: [Card] = []
  init(defaultData: Bool = false) {
    if defaultData {
      cards = initialCards
    }
  }
  func index(for card: Card) -> Int? {
    cards.firstIndex { $0.id == card.id }
  }
  
  func remove(_ card: Card) {
    if let index = index(for: card) {
      cards.remove(at: index)
    }
  }
}


