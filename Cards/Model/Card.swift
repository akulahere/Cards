//
//  Card.swift
//  Cards
//
//  Created by Dmytro Akulinin on 17.08.2022.
//

import SwiftUI

struct Card: Identifiable {
  var id = UUID()
  var backgroundColor: Color = .yellow
  var elements: [CardElement] = []
  
  mutating func remove(_ element: CardElement) {
    if let element = element as? ImageElement {
      UIImage.remove(name: element.imageFilename)
    }

    if let index = element.index(in: elements) {
      elements.remove(at: index)
    }
    save()

  }
  
  mutating func addElement(uiImage: UIImage) {
    let imageFilename = uiImage.save()
    let image = Image(uiImage: uiImage)
    let element = ImageElement(
      image: image,
      imageFilename: imageFilename)
    elements.append(element)
    save()

  }


  mutating func update(_ element: CardElement?, frame: AnyShape) {
    if let element = element as? ImageElement,
       let index = element.index(in: elements) {
      var newElement = element
      newElement.frame = frame
      elements[index] = newElement
    }
    save()

  }
  
  func save() {
    do {
      // 1
      let encoder = JSONEncoder()
      // 2
      let data = try encoder.encode(self)
      // 3
      let filename = "\(id).rwcard"
      if let url = FileManager.documentURL?
        .appendingPathComponent(filename) {
        // 4
        try data.write(to: url)
      }
    } catch {
      print(error.localizedDescription)
    }
  }

}

extension Card: Codable {
  enum CodingKeys: CodingKey {
    case id, backgroundColor, imageElements, textElements
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    // 1
    let id = try container.decode(String.self, forKey: .id)
    self.id = UUID(uuidString: id) ?? UUID()
    // 2
    elements += try container
      .decode([ImageElement].self, forKey: .imageElements)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id.uuidString, forKey: .id)
    let imageElements: [ImageElement] =
    elements.compactMap { $0 as? ImageElement }
    try container.encode(imageElements, forKey: .imageElements)
  }

}
