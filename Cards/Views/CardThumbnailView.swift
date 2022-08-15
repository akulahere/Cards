//
//  CardThumbnailView.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

import SwiftUI

struct CardThumbnailView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 15)
      .foregroundColor(.gray)
      .frame(width: 150, height: 250)
    
  }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView()
    }
}
