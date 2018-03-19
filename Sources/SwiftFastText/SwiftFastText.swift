//
//  FastText.swift
//  FastText Swift Wrapper
//
//  Created by Jacopo Mangiavacchi on 3/15/18.
//  Copyright © 2018 Jacopo Mangiavacchi. All rights reserved.
//

import Foundation
import CFastTextWrapper

open class SwiftFastText {
    fileprivate let fastTextObject: UnsafeMutableRawPointer

    public init() {
        self.fastTextObject = UnsafeMutableRawPointer(mutating: CFastTextWrapper.initializeFastTextObject())
    }
    
    public convenience init(withModelUrl: URL) {
        self.init()
        loadModel(withModelUrl)
    }

    public func loadModel(_ url: URL) {
        var cPath = url.path.cString(using: .utf8)!
        CFastTextWrapper.fasttextLoadModel(fastTextObject, &cPath);    
    }
    
    public func getSentenceVector(sentence: String) -> [Double] {
        var cSentence = sentence.cString(using: .utf8)!
        var sentenceVector = [Double](repeating: 0.0, count: Int(CFastTextWrapper.fasttextgetDimension(fastTextObject)))

        CFastTextWrapper.fasttextgetSentenceVector(fastTextObject, &cSentence, &sentenceVector);    

        return sentenceVector
    }
}

