//
//  CardModal.swift
//  Cards
//
//  Created by Dmytro Akulinin on 15.08.2022.
//

enum CardModal: Identifiable {
  var id: Int {
    hashValue
  }
  case photoPicker, framePicker, stickerPicker, textPicker
}

