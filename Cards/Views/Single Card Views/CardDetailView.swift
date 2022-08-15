//
//  CardDetailView.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

struct CardDetailView: View {
  @EnvironmentObject var viewState: ViewState
  @State private var currentModal: CardModal?
  
  var body: some View {
    content
      .modifier(CardToolbar(currentModal: $currentModal))
  }
  
  var content: some View {
    ZStack {
      Group {
        Capsule()
          .foregroundColor(.yellow)
        Text("Resize Me!")
          .fontWeight(.bold)
          .font(.system(size: 500))
          .minimumScaleFactor(0.01)
          .lineLimit(1)
      }
      .resizableView()
      Circle()
        .resizableView()
        .offset(CGSize(width: 50, height: 200))
    }
  }
}

struct CardDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CardDetailView()
      .environmentObject(ViewState())
  }
}
