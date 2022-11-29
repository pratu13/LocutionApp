//
//  Constants.swift
//  WriteItDown
//
//  Created by Pratyush  on 3/23/21.
//

import Foundation
import SwiftUI

let screen = UIScreen.main.bounds

struct Model {
    
    static var word: SearchWord = SearchWord(word: "vapid",
                                             phonetic: "/ˈveɪp.ɪd/",
                                             origin: nil,
                                             phonetics: [Phonetic(text: "/ˈveɪp.ɪd/", audio: "https://api.dictionaryapi.dev/media/pronunciations/en/vapid-us.mp3", sourceURL: "https://commons.wikimedia.org/w/index.php?curid=50048987", license: License(name: "BY-SA 4.0", url: "https://creativecommons.org/licenses/by-sa/4.0"))],
                                             meanings: [Meaning(partOfSpeech: "adjective", definitions: [Definition(definition: "Offering nothing that is stimulating or challenging.", synonyms: [], antonyms: [], example: nil), Definition(definition: "Lifeless, dull, or banal.", synonyms: [], antonyms: [], example: nil)], synonyms: ["dull"], antonyms: ["exciting"])],
                                             license: License(name: "CC BY-SA 3.0", url: "https://creativecommons.org/licenses/by-sa/3.0"),
                                             sourceUrls: ["https://en.wiktionary.org/wiki/vapid"])
    
    static var word2: SearchWord = SearchWord(word: "frivolous",
                                             phonetic: "/ˈfɹɪv.əl.əs/",
                                             origin: nil,
                                             phonetics: [Phonetic(text: "/ˈfɹɪv.əl.əs/", audio: "https://api.dictionaryapi.dev/media/pronunciations/en/frivolous-au.mp3", sourceURL: "https://commons.wikimedia.org/w/index.php?curid=75796937", license: License(name: "BY-SA 4.0", url: "https://creativecommons.org/licenses/by-sa/4.0"))],
                                             meanings: [Meaning(partOfSpeech: "adjective", definitions: [Definition(definition: "Silly, especially at an inappropriate time or in an inappropriate manner.", synonyms: [], antonyms: [], example: nil), Definition(definition: "Of little weight or importance; not worth notice; slight.", synonyms: [], antonyms: [], example: nil)], synonyms: ["dull"], antonyms: ["exciting"])],
                                             license: License(name: "CC BY-SA 3.0", url: "https://creativecommons.org/licenses/by-sa/3.0"),
                                             sourceUrls: ["https://en.wiktionary.org/wiki/frivolous"])
    
    static var viewModel = AppViewModel()
    
    
}
