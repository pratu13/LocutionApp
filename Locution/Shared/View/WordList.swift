//
//  WordList.swift
//  Locution
//
//  Created by pratyush on 8/16/22.
//

import SwiftUI

struct WordList: View {
    @EnvironmentObject var viewModel: AppViewModel
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Colors.Palette.lavender.color
                .ignoresSafeArea()
    
                ScrollView {
                    LazyVStack {
                        ForEach(0..<viewModel.favoriteWords.count, id: \.self) { (index) in
                            FavouriteWordCard(namespace: namespace, word: viewModel.favoriteWords[index].word)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        viewModel.favoriteWords[index].show = true
                                    }
                                }
                                .matchedGeometryEffect(id: viewModel.favoriteWords[index].id, in:  namespace, properties: .frame, isSource: !viewModel.favoriteWords[index].show)
                        }
                    }
                }
            
            fullContentView
        }
    
    }
    
    @ViewBuilder
    var fullContentView: some View {
        ForEach(Array(viewModel.favoriteWords.enumerated()), id: \.1.id) { (index, wrapper) in
            if viewModel.favoriteWords[index].show {
                WordDetailView(namespace: namespace, wrapper: wrapper)
                    .matchedGeometryEffect(id: viewModel.favoriteWords[index].id, in: namespace, properties: .frame, isSource: viewModel.favoriteWords[index].show)
                    .environmentObject(viewModel)
            }
        }
    }
    
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList()
            .environmentObject(Model.viewModel)
    }
}
