//
//  SearchView.swift
//  Locution
//
//  Created by pratyush on 8/10/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct SearchView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @Environment(\.dismissSearch) var dismissSearch
    @Environment(\.isSearching) var isSearching
    
    @State var isNavigating: Bool = false
    @State var selected: SearchWord? = nil
    
    var body: some View {
        ZStack {
            VStack {
                if (viewModel.searchWords.count != 0) {
                    Text("Recent Searches")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                
                List {
                    ForEach(0..<viewModel.searchWords.count, id:\.self) { (index) in
                        ScrollView([.horizontal]) {
                            LazyHStack {
                                let searchWord = viewModel.searchWords[index]
                                ForEach(0..<searchWord.count, id:\.self) { (index2) in
                                    NavigationLink {
                                       Text("Hello")
                                    } label: {
                                        ExtractedView(word: searchWord[index2])
                                    }
                                }
                                Spacer()
                            }
                        }
                        .padding(.top, 5)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .searchable(text: $viewModel.searchText)
//                .searchable(text: $viewModel.searchText, prompt: "Word Search", suggestions: {
//                    ForEach(0..<viewModel.searchWords.count, id:\.self) { index in
//                        let searchWord = viewModel.searchWords[index]
//                        ForEach(searchWord.filter {
//                            $0.localizedCaseInsensitiveContains($viewModel.searchText) }, id: \.self) {
//                                suggestion in
//                                Text(suggestion)
//                                    .searchCompletion(suggestion)
//                            }
//                    }
//                })
                .onSubmit(of: .search, {
                    viewModel.searchText = ""
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Clear All")
                            .onTapGesture {
                                viewModel.clearRecentSearch()
                            }
                    }
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
            
        }
    }
}

@available(iOS 15.0, *)
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(AppViewModel())
    }
}

struct ExtractedView: View {
    var word: SearchWord
    
    var body: some View {
        GroupBox() {
            HStack {
                Text(String.safe(word: word.word))
                    .font(.headline)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            .cornerRadius(10.0)
        }
    }
}

extension String {
    static func safe(word: Self?) -> String {
        if let word = word {
            return word
        } else {
            return ""
        }
    }
}
