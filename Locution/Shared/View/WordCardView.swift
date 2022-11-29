//
//  WordCard.swift
//  Locution
//
//  Created by pratyush on 8/16/22.
//

import SwiftUI

struct WordCardView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var word: FavouriteWord
    @Namespace var namespace
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            if !show {
                
            } else {
                WordDetailView(namespace: namespace, wrapper: word)
                    .environmentObject(viewModel)
                    .ignoresSafeArea()
            }
        }
        
    }
}

struct WordCardView_Previews: PreviewProvider {
    static var previews: some View {
        WordCardView(word: FavouriteWord(word: Model.word, show: false, appear: false))
            .environmentObject(AppViewModel())
    }
}
