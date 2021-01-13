//
//  RGB.swift
//  ColorSenseExtension
//
//  Created by Anlesu on 2021/1/12.
//

import Foundation
struct RGB: Equatable {
  let r: Float
  let g: Float
  let b: Float
}

func == (lhs: RGB, rhs: RGB) -> Bool {
  return lhs.r == rhs.r
    && lhs.g == rhs.g
    && lhs.b == rhs.b
}
