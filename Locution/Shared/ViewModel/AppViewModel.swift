//
//  AppViewModel.swift
//  Locution
//
//  Created by Pratyush  on 4/13/21.
//

import Foundation
import CoreData
import SwiftUI
import Combine

class FavouriteWord: ObservableObject {
    let id = UUID()
    let word: SearchWord
    @Published var show: Bool
    @Published var appear: Bool
    
    init(word: SearchWord, show: Bool, appear: Bool) {
        self.word = word
        self.show = show
        self.appear = appear
    }
}

class AppViewModel: ObservableObject {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Word.dateAdded, ascending: false)]) var savedWords: FetchedResults<Word>
    @Published var words = [Words]()
    @Published var searchWords: [[SearchWord]] = []
    @Published var favoriteWords: [FavouriteWord] = [FavouriteWord(word: Model.word2, show: false, appear: false), FavouriteWord(word: Model.word, show: false, appear: false), FavouriteWord(word: Model.word2, show: false, appear: false), FavouriteWord(word: Model.word, show: false, appear: false)]
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    
    var subscription = Set<AnyCancellable>()
    
    init() {
//        self.words = savedWords.map(Words.init)
        $searchText
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.search(for: term)
            }
            .store(in: &subscription)
    }
    
    private func search(for term: String) {
        isLoading = true
        guard !term.isEmpty else {
            isLoading = false
            return
        }
        guard let url = URL(string: NetworkConstant.search(term).word) else {
            return
        }
        
        if searchWords.contains(where: { words in
            return words.contains(where: {$0.word == term})
        })  {
            isLoading = false
            self.searchText = ""
            return
        }
        
        NetworkManager.fetch(url: url)
            .decode(type: [SearchWord].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion) { [weak self ] _searchWords in
                self?.searchWords.append(_searchWords)
                self?.isLoading = false
                self?.searchWords.reverse()
            }
            .store(in: &subscription)
        
   
    }
    
    func save(title: String, meaning: String, context: NSManagedObjectContext) {
        let newWord = Word(context: context)
        newWord.title = title
        newWord.meaning = meaning
        newWord.dateAdded = Date()
        words.append(.init(word: newWord))
        saveContext(with: context)
    }
    
    func remove(index: Int, context: NSManagedObjectContext, from wordS: FetchedResults<Word>) {
        context.delete(wordS[index])
        words.remove(at: index)
        saveContext(with: context)
    }
    
    func update() {
        
    }

    private func saveContext(with context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error \(error)")
        }
    }
    
    func addToFavorite(word: SearchWord) {
        let favoriteWord = FavouriteWord(word: word, show: false, appear: false)
        favoriteWords.append(favoriteWord)
    }
    
    func removeFromFavorite(word: SearchWord) {
        guard let index = favoriteWords.firstIndex(where: { $0.word.id == word.id }) else {
            return
        }
        favoriteWords.remove(at: index)
    }
    
    func clearRecentSearch() {
        searchWords.removeAll()
    }
}
