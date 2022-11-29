//
//  AddWordView.swift
//  Locution
//
//  Created by Pratyush  on 4/13/21.
//

import SwiftUI
import CoreData

struct AddWordView: View {
    
    @Binding var wordTitle: String
    @Binding var wordMeaning: String
    @Binding var addButtonTapped: Bool
    
    var viewModel: AppViewModel
    var viewContext: NSManagedObjectContext
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            
            HStack {
                Spacer()
                Image("addWord")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("Add a new word")
                    .font(.title)
                    .bold()
                    .foregroundColor(Colors.Palette.languidLavender.color)
                Spacer()
            }
            
            HStack {
                Spacer()
                TextField("Enter the word", text: $wordTitle)
                    .padding()
                    .frame(height: 44)
                    .foregroundColor(Color.black)
                    .frame(width: screen.width - 100)
                    .background(Color.white.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10.0, style: .circular).stroke(Colors.Palette.languidLavender.color, lineWidth: 2.0))
                Spacer()
            }
            
            HStack {
                Spacer()
                TextField("Enter the meaning", text: $wordMeaning)
                    .padding()
                    .frame(height: 44)
                    .foregroundColor(Color.black)
                    .frame(width: screen.width - 100)
                    .background(Color.white.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10.0, style: .circular).stroke(Colors.Palette.languidLavender.color, lineWidth: 2.0))
                Spacer()
            }
            
            
            Image("scrabble")
                .resizable()
                .frame(height: screen.height/3)
                .frame(maxWidth: .infinity)
                .opacity(0.1)
                .rotationEffect(.degrees(40))
                .offset(x: -20, y: 50)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    viewModel.save(title: wordTitle.lowercased(), meaning: wordMeaning.lowercased(), context: viewContext)
                    wordTitle = ""
                    wordMeaning = ""
                    self.addButtonTapped = false
                }, label: {
                    Text("Save")
                        .font(.callout)
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: screen.width/4, height: 44.0)
                        .background(Colors.Palette.queenPink.color)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                })
                .padding()
                
                
                Spacer()
            }
        }
        .padding(.vertical, 16)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .shadow(color: Colors.Palette.lavender.color.opacity(0.5), radius: 10.0, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.0)
        .padding()
        
        
    }
    
}

//struct AddWordView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            AddWordView(wordTitle: .constant(""), wordMeaning: .constant(""), addButtonTapped: .constant(false))
//            AddWordView(wordTitle: .constant(""), wordMeaning: .constant(""), addButtonTapped: .constant(false))
//                .previewDevice("iPhone 8")
//        }
//
//
//    }
//}
