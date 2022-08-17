//
//  CardsListView.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

struct CardsListView: View {
  @EnvironmentObject var viewState: ViewState
  @EnvironmentObject var store: CardStore

  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        ForEach(store.cards) { card in
          CardThumbnailView(card: card)
            .contextMenu {
              Button(action: { store.remove(card) }) {
                Label("Delete", systemImage: "trash")
              }
            }
            .onTapGesture {
              viewState.showAllCards.toggle()
              viewState.selectedCard = card

            }
        }
      }
    }
  }
}

struct CardsListView_Previews: PreviewProvider {
  static var previews: some View {
    CardsListView()
      .environmentObject(ViewState())
      .environmentObject(CardStore(defaultData: true))

  }
}
