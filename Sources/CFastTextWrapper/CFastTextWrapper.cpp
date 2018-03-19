//
//  CFastTextWrapper.cpp
//  CFastTextWrapper C Wrapper
//
//  Created by Jacopo Mangiavacchi on 3/15/18.
//  Copyright © 2018 Jacopo Mangiavacchi. All rights reserved.
//

#include "include/CFastTextWrapper.hpp"
#include "FastText/fasttext.h"


const void * initializeFastTextObject() {
    fasttext::FastText *ft = new fasttext::FastText();
    return (void *)ft;
}


void fasttextLoadModel(const void *object, const char* path) {
    fasttext::FastText *ft = (fasttext::FastText *)object;
    ft->loadModel(path);
}
