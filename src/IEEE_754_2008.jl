module IEEE_754_2008

import Base: min, max, minmax, precision, ldexp, frexp

include("ieee.jl")
include("extensions.jl")
include("ulpufp.jl")

# include bypasses precompilation
modulename = :QNaN; @eval import $modulename
using QNaN

export negate, copySign, 
    isSignMinus, isNormal, isFinite, is Zero, isSubnormal, isInfinite, isNaN,
    scaleB, logB,
    compareQuietEqual, compareQuietNotEqual,
    totalOrder, totalOrderMag,
    minNum, maxNum, minNumMag, maxNumMag,
    # extensions
    min, max, minmax, maxmin, fast_minmax, fast_maxmin,
    minmaxMag, maxmin, maxminMag,
    # ulpufp
    epsilon, eta, ulp, ufp, sulp, sufp,
    # QNaN
    qnan


end # module
