//
//  SingleCardView.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

struct SingleCardView: View {
  @EnvironmentObject var viewState: ViewState

  var body: some View {
    NavigationView {
      CardDetailView()
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
  }
}

struct SingleCardView_Previews: PreviewProvider {
  static var previews: some View {
    SingleCardView()
      .environmentObject(ViewState())
  }
}


