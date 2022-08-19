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
  @Binding var card: Card
  @State private var stickerImage: UIImage?
  @State private var images: [UIImage] = []
  @State private var frame: AnyShape?

  var body: some View {
    content
      .onDrop(of: [.image], delegate: CardDrop(card: $card))
      .modifier(CardToolbar(currentModal: $currentModal))
      .sheet(item: $currentModal) { item in
        switch item {
        case .stickerPicker:
          StickerPicker(stickerImage: $stickerImage)
            .onDisappear {
              if let stickerImage = stickerImage {
                card.addElement(uiImage: stickerImage)
              }
              stickerImage = nil
            }
        case .photoPicker:
          PhotoPicker(images: $images)
            .onDisappear {
              for image in images {
                card.addElement(uiImage: image)
              }
              images = []
            }
        case .framePicker:
          FramePicker(frame: $frame)
            .onDisappear {
              if let frame = frame {
                card.update(
                  viewState.selectedElement,
                  frame: frame)
              }
              frame = nil
            }

        default:
          EmptyView()
        }
      }
  }
  
  var content: some View {
    ZStack {
      card.backgroundColor
        .edgesIgnoringSafeArea(.all)
      ForEach(card.elements, id: \.id) { element in
        CardElementView(element: element)
          .resizableView(transform: bindingTransform(for: element))
          .frame(
            width: element.transform.size.width,
            height: element.transform.size.height)
          .contextMenu {
            Button(action: { card.remove(element) }) {
              Label("Delete", systemImage: "trash")
            }
          }
      }

    }
  }
  
  func bindingTransform(for element: CardElement)
  -> Binding<Transform> {
    guard let index = element.index(in: card.elements) else {
      fatalError("Element does not exist")
    }
    return $card.elements[index].transform
  }


}

struct CardDetailView_Previews: PreviewProvider {
  struct CardDetailPreview: View {
    @State private var card = initialCards[0]
    var body: some View {
      CardDetailView(card: $card)
        .environmentObject(ViewState(card: card))
    }
  }
  
  static var previews: some View {
    CardDetailPreview()
  }
}

