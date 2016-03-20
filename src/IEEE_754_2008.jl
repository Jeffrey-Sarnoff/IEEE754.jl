module IEEE_754_2008

include("QNAN.jl")
using QNaN

export negate, copySign, 
    isSignMinus, isNormal, isFinite, is Zero, isSubnormal, isInfinite, isNaN,
    scaleB, logB,
    compareQuietEqual, compareQuietNotEqual,
    totalOrder, totalOrderMag,
    minNum, maxNum, minNumMag, maxNumMag,
    # extensions
    minmax, minmaxMag, maxmin, maxminMag,
    qnan


end # module
