//
//  FavouriteWordCard.swift
//  Locution
//
//  Created by pratyush on 8/16/22.
//

import SwiftUI

struct FavouriteWordCard: View {
    var namespace: Namespace.ID
    var word: SearchWord

    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(word.word_)
                        .font(.title)
                        .matchedGeometryEffect(id: "word", in: namespace)
                    Text(word.phonetic_)
                    
                    Spacer()
                    WatermarkView(character: word.word?.first?.uppercased() ?? "W", color: Colors.Palette.floralWhite.color)
                        .matchedGeometryEffect(id: "watermark", in: namespace)
                }
                .matchedGeometryEffect(id: "info", in: namespace)
                
                Text(word.meanings?.first?.definitions?.first?.definition ?? "")
                    .font(.callout)
                    .matchedGeometryEffect(id: "definition", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask (RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
        }
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity)
        .background(Colors.Palette.indigoDye.color.matchedGeometryEffect(id: "background", in: namespace))
        .mask{
            RoundedRectangle(cornerRadius: 10.0)
                .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .padding(20)
    }
}

struct FavouriteWordCard_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        
        FavouriteWordCard(namespace: namespace, word:Model.word)
    }
}
