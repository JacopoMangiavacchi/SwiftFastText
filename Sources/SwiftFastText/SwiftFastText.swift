//
//  FastText.swift
//  FastText Swift Wrapper
//
//  Created by Jacopo Mangiavacchi on 3/15/18.
//  Copyright © 2018 Jacopo Mangiavacchi. All rights reserved.
//

import Foundation
import CFastTextWrapper

open class FastText {
    fileprivate let fastTextObject: UnsafeMutableRawPointer

    init() {
        self.fastTextObject = UnsafeMutableRawPointer(mutating: CFastTextWrapper.initializeFastTextObject())
    }
    
    convenience init(withModelUrl: URL) {
        self.init()
        loadModel(withModelUrl)
    }

    func loadModel(_ url: URL) {
        var cPath = url.path.cString(using: .utf8)!
        CFastTextWrapper.fasttextLoadModel(fastTextObject, &cPath);    
    }
    
    func getSentenceVector(sentence: String) -> [Double] {
        var cSentence = sentence.cString(using: .utf8)!
        var sentenceVector = [Double](repeating: 0.0, count: Int(CFastTextWrapper.fasttextgetDimension(fastTextObject)))

        CFastTextWrapper.fasttextgetSentenceVector(fastTextObject, &cSentence, &sentenceVector);    

        return sentenceVector
    }
}

