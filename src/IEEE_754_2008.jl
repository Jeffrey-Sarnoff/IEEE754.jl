module IEEE_754_2008

import Base: min, max, minmax, precision, ldexp, frexp

include("ieee.jl")
include("extensions.jl")
include("ulpufp.jl")

# include bypasses precompilation
# modulename = :QNaN; @eval begin import $modulename; using $modulename end
modulename = :QNaN; @eval importall $modulename

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
