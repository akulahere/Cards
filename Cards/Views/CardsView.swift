//
//  CardsView.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

import SwiftUI

struct CardsView: View {
  @EnvironmentObject var viewState: ViewState
  @EnvironmentObject var store: CardStore

  var body: some View {
    ZStack {
      VStack {
        Button(action: {
          viewState.selectedCard = store.addCard()
          viewState.showAllCards = false
        }, label: {
          Text("Add")
        })
        CardsListView()
      }
      if !viewState.showAllCards {
        SingleCardView()
      }
    }
  }
}

struct CardsView_Previews: PreviewProvider {
  static var previews: some View {
    CardsView()
      .environmentObject(ViewState())
      .environmentObject(CardStore(defaultData: true))
  }
}
