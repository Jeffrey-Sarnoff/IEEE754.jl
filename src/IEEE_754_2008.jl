module IEEE_754_2008

export negate, copySign, 
    isSignMinus, isNormal, isFinite, is Zero, isSubnormal, isInfinite, isNaN,
    scaleB, logB,
    compareQuietEqual, compareQuietNotEqual,
    totalOrder, totalOrderMag,
    minNum, maxNum, minNumMag, maxNumMag,
    # extensions
    minmax, minmaxMag, maxmin, maxminMag,
    qnan, qnan64, qnan32, qnan16
    
include("QNAN.jl")
using QNaN


end # module
