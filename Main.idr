module Main

import MonadLike

testFinite : MonadLike True Int
testFinite = do pureC False Z
                pureC True 5

testInfinite : MonadLike True Int
testInfinite = do pureC True Z
                  testInfinite


