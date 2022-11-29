//
//  Word.swift
//  Locution
//
//  Created by pratyush on 8/10/22.
//

import Foundation

/*
[
  {
    "word": "clandestine",
    "phonetic": "/klænˈdɛstɪn/",
    "phonetics": [
      {
        "text": "/klænˈdɛstɪn/",
        "audio": "https://api.dictionaryapi.dev/media/pronunciations/en/clandestine-au.mp3",
        "sourceUrl": "https://commons.wikimedia.org/w/index.php?curid=75729429",
        "license": {
          "name": "BY-SA 4.0",
          "url": "https://creativecommons.org/licenses/by-sa/4.0"
        }
      },
      {
        "text": "/klænˈdɛstɪn/",
        "audio": "https://api.dictionaryapi.dev/media/pronunciations/en/clandestine-us.mp3",
        "sourceUrl": "https://commons.wikimedia.org/w/index.php?curid=1088552",
        "license": {
          "name": "BY-SA 3.0",
          "url": "https://creativecommons.org/licenses/by-sa/3.0"
        }
      }
    ],
    "meanings": [
      {
        "partOfSpeech": "adjective",
        "definitions": [
          {
            "definition": "Done or kept in secret, sometimes to conceal an illicit or improper purpose.",
            "synonyms": [
              "covert",
              "furtive",
              "hush-hush",
              "secret",
              "secretive",
              "undercover"
            ],
            "antonyms": [],
            "example": "clandestine military operations"
          },
          {
            "definition": "(of a person or lodge) Not recognized as a regular member.",
            "synonyms": [],
            "antonyms": []
          }
        ],
        "synonyms": [
          "covert",
          "furtive",
          "hush-hush",
          "secret",
          "secretive",
          "undercover"
        ],
        "antonyms": []
      }
    ],
    "license": {
      "name": "CC BY-SA 3.0",
      "url": "https://creativecommons.org/licenses/by-sa/3.0"
    },
    "sourceUrls": [
      "https://en.wiktionary.org/wiki/clandestine"
    ]
  }
]
*/

// MARK: - SearchWord
struct SearchWord: Codable, Identifiable {
    let id = UUID()
    let word: String?
    let phonetic: String?
    let origin: String?
    let phonetics: [Phonetic]?
    let meanings: [Meaning]?
    let license: License?
    let sourceUrls: [String]?
    
    var word_: String {
        guard let word = word else {
            return ""
        }
        return word
    }
    
    var phonetic_: String {
        guard let phonetic = phonetic else {
            return ""
        }
        return phonetic
    }
    
    var origin_: String {
        guard let origin = origin else {
            return ""
        }
        return origin
    }

}


// MARK: - License
struct License: Codable {
    let name: String?
    let url: String?
    
    var name_: String {
        guard let name = name else {
            return ""
        }
        return name
    }
    
    var url_: String {
        guard let url = url else {
            return ""
        }
        return url
    }
}

// MARK: - Meaning
struct Meaning: Codable {
    let partOfSpeech: String?
    let definitions: [Definition]?
    let synonyms: [String]?
    let antonyms: [String]?
    
    var partOfSpeech_: String {
        guard let partOfSpeech = partOfSpeech else {
            return ""
        }
        return partOfSpeech
    }
    
    var synonyms_: [String] {
        guard let synonyms = synonyms else {
            return []
        }
        return synonyms.compactMap {$0}
    }
    var antonyms_: [String] {
        guard let antonyms = antonyms else {
            return []
        }
        return antonyms.compactMap {$0}
    }

}

// MARK: - Definition
struct Definition: Codable {
    let definition: String?
    let synonyms: [String]?
    let antonyms: [String]?
    let example: String?
    
    var definition_: String {
        guard let definition = definition else {
            return ""
        }
        return definition
    }
    
    var example_: String {
        guard let example = example else {
            return ""
        }
        return example
    }
    
    var synonyms_: [String] {
        guard let synonyms = synonyms else {
            return []
        }
        return synonyms.compactMap {$0}
    }
    var antonyms_: [String] {
        guard let antonyms = antonyms else {
            return []
        }
        return antonyms.compactMap {$0}
    }
}

// MARK: - Phonetic
struct Phonetic: Codable {
    let text: String?
    let audio: String?
    let sourceURL: String?
    let license: License?

    enum CodingKeys: String, CodingKey {
        case text, audio
        case sourceURL = "sourceUrl"
        case license
    }
}
