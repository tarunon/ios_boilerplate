//
//  ContentView.swift
//  App
//
//  Created by tarunon on 2021/05/15.
//

import Bundles
import SwiftUI

public struct ContentView: View {
  public init() {}

  public var body: some View {
    Text.helloWorld
      .padding()
      .background(Color.backgroundColor)
  }
}

#if DEBUG

  public struct ContentView_Previews: PreviewProvider {
    public static var previews: some View {
      ContentView()
    }
  }

#endif
