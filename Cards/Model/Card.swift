//
//  Card.swift
//  Cards
//
//  Created by Dmytro Akulinin on 17.08.2022.
//

import SwiftUI

struct Card: Identifiable {
  let id = UUID()
  var backgroundColor: Color = .yellow
  var elements: [CardElement] = []
  
  mutating func remove(_ element: CardElement) {
    if let index = element.index(in: elements) {
      elements.remove(at: index)
    }
  }
  
  mutating func addElement(uiImage: UIImage) {
    let image = Image(uiImage: uiImage)
    let element = ImageElement(image: image)
    elements.append(element)
  }


}
