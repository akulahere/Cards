//
//  Pencil.swift
//  Cards
//
//  Created by Dmytro Akulinin on 18.08.2022.
//

import SwiftUI
import PencilKit

struct PencilView: View {
  @State private var canvas = PKCanvasView()
  
  var body: some View {
    PencilViewRepresentable(canvas: $canvas)
  }
}

struct PencilView_Previews: PreviewProvider {
  static var previews: some View {
    PencilView()
  }
}

struct PencilViewRepresentable: UIViewRepresentable {
  @Binding var canvas: PKCanvasView
  
  func makeUIView(context: Context) -> some UIView {
    canvas.drawingPolicy = .anyInput
    return canvas
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
  }
}
