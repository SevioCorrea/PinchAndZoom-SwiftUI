//
//  ContentView.swift
//  PinchAndZoom
//
//  Created by Sévio Basilio Corrêa on 02/01/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPRIEDADE
    @State private var isAnimating: Bool = false // @State para atualizar a interface sempre que a Variável for alterada.
    @State private var imageScale: CGFloat = 1
    @State private var currentPosition: CGSize = .zero
    
    // MARK: - Função
    
    
    // MARK: - Content
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Page Image
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(imageScale)
                // MARK: - 1. Tap Gesture
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            withAnimation(.spring()) {
                                imageScale = 1
                            }
                        }
                    }
            } // MARK: - ZStack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
        } // MARK: - Navigation
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
