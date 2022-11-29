//
//  ContentView.swift
//  Shared
//
//  Created by Pratyush  on 4/13/21.
//

import SwiftUI
import CoreData

//struct LocutionList: View {
//    @EnvironmentObject var viewModel: AppViewModel
//
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
//    
//    var body: some View {
//        ZStack {
//            ScrollView(showsIndicators: false) {
//                LazyVGrid(columns: columns) {
//                    ForEach(0..<viewModel.favoriteWords.count, id: \.self) { index in
//                        NavigationLink{
//                            WordDetailView(word: viewModel.favoriteWords[index])
//                                .environmentObject(viewModel)
//                        } label: {
//                            WordCard(word: viewModel.favoriteWords[index],
//                                     gradient: [Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)), Colors.Palette.floralWhite.color.opacity(0.4), Colors.Palette.floralWhite.color.opacity(0.4)]
//                            )
//                            .id(viewModel.favoriteWords[index].id)
//                            .foregroundColor(Color.primary)
//                            .padding(.vertical, 5)
//                        }
//                    }
//                }
//                .padding(.horizontal, 16)
//            }
//
//            if viewModel.favoriteWords.count == 0 {
//                VStack {
//                    Text("Your word library is empty. Tap on + to add new words.")
//                        .padding()
//                        .foregroundColor(.secondary)
//                        .multilineTextAlignment(.center)
//                        .minimumScaleFactor(3.0)
//                }
//            }
//        }
//    }
//}
//
//struct LocutionList_Previews: PreviewProvider {
//    static var previews: some View {
//        LocutionList()
//    }
//}


struct WordCard: View {
    var word: SearchWord
    var gradient: [Color]
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ZStack(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack {
                        Text(word.word ?? "")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    HStack {
                        Text(word.meanings?.first?.definitions?.first?.definition ?? "")
                            .font(.subheadline)
                            .italic()
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: gradient.shuffled()), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
            }
            
            WatermarkView(character: word.word?.first?.uppercased() ?? "L", color: gradient[0] )
                .padding()
            
        }
    }
}




