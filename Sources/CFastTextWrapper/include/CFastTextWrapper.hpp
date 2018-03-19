//
//  CFastTextWrapper.hpp
//  CFastTextWrapper C Wrapper
//
//  Created by Jacopo Mangiavacchi on 3/15/18.
//  Copyright © 2018 Jacopo Mangiavacchi. All rights reserved.
//

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

    const void * initializeFastTextObject();
    void fasttextLoadModel(const void *object, const char* path);

#ifdef __cplusplus
}
#endif
