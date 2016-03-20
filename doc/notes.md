### QNaNs and their representation

#### for Binary64
    7ff8000000000000 :                 +1.#QNAN Quiet NaN   the 'usual' NaN bitpattern 
    7ff8000000000001 :                 +1.#QNAN Quiet NaN
    7ffffffffffffffe :                 +1.#QNAN Quiet NaN
    7fffffffffffffff :                 +1.#QNAN Quiet NaN
    
    fff8000000000000 :                 -1.#IND Quiet NaN   the 'usual' negNaN = -NaN (shows as NaN)
    fff8000000000001 :                 -1.#QNAN Quiet NaN
    fffffffffffffffe :                 -1.#QNAN Quiet NaN    
    ffffffffffffffff :                 -1.#QNAN Quiet NaN

    there are 2^52 possible Quiet NaN payloads, 2^51 | signbit(qNaN)==false and 2^51 | signbit(qNaN)==true
              ( 0x7fffffffffffffff - 0x7ff8000000000000 - 0x01 + 0x02 ) `pos` QNaNs 2^51
              ( 0xffffffffffffffff - 0xfff8000000000000 - 0x01 + 0x02 ) `neg` QNaNs 2^51
              
    
#### for Binary32

    0x7fc00000     +1.#QNAN    conventional bit pattern for qNaN32
    0x7fc00001     +1.#QNAN
    0x7ffffffe     +1.#QNAN
    0x7fffffff     +1.#QNAN
    
    0xffc00000     -1.#IND    `neg` of conventional bit pattern for qNaN32
    0xffc00001     -1.#QNAN
    0xfffffffe     -1.#QNAN
    0xffffffff     -1.#QNAN
    
    there are 2^23 possible Quiet NaN32 payloads, 2^22 | signbit(qNaN32)==false and 2^22 | signbit(qNaN32)==true
    

#### for Binary16

    0x7e00         +1.#QNAN    conventional bit pattern for qNaN16
    0x7e01         +1.#QNAN
    0x7ffe         +1.#QNAN
    0x7fff         +1.#QNAN
    
    0xfe00         -1.#IND     `neg` of conventional bit patttern for qNaN16
    0xfe01         -1.#QNAN
    0xfffe         -1.#QNAN
    0xffff         -1.#QNAN
        
    there are 2^10 possible Quiet NaN16 payloads, 2^9 | signbit(qNaN16)==false and 2^9 | signbit(qNaN16)==true
    
    
    



