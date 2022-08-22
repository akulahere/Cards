//
//  CardElement.swift
//  Cards
//
//  Created by Dmytro Akulinin on 17.08.2022.
//

import SwiftUI

protocol CardElement {
  var id: UUID { get }
  var transform: Transform { get set }
}

extension CardElement {
  func index(in array: [CardElement]) -> Int? {
    array.firstIndex { $0.id == id }
  }
}

struct ImageElement: CardElement {
  let id = UUID()
  var transform = Transform()
  var image: Image
  var imageFilename: String?
  var frame: AnyShape?
}

extension ImageElement: Codable {
  enum CodingKeys: CodingKey {
    case transform, imageFilename, frame
  }
  
  init(from decoder: Decoder) throws {
    let container =
    try decoder.container(keyedBy: CodingKeys.self)
    // 1
    transform =
    try container.decode(Transform.self, forKey: .transform)
    // 2
    imageFilename =
    try container.decodeIfPresent(
      String.self,
      forKey: .imageFilename)
    // 3
    if let imageFilename = imageFilename,
       let uiImage = UIImage.load(uuidString: imageFilename) {
      image = Image(uiImage: uiImage)
    } else {
      // 4
      image = Image("error-image")
    }
    if let index =
        try container.decodeIfPresent(Int.self, forKey: .frame) {
      frame = Shapes.shapes[index]
    }
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(transform, forKey: .transform)
    try container.encode(imageFilename, forKey: .imageFilename)
    if let index =
        Shapes.shapes.firstIndex(where: { $0 == frame }) {
      try container.encode(index, forKey: .frame)
    }
  }
}

struct TextElement: CardElement {
  let id = UUID()
  var transform = Transform()
  var text = ""
  var textColor = Color.black
  var textFont = "San Fransisco"
}
