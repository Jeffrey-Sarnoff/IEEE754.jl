module IEEE_754_2008

import Base: precision, ldexp, frexp

include("ieee.jl")
include("extensions.jl")
include("ulpufp.jl")

include("QNaN.jl")
using QNaN

export negate, copySign, 
    isSignMinus, isNormal, isFinite, is Zero, isSubnormal, isInfinite, isNaN,
    scaleB, logB,
    compareQuietEqual, compareQuietNotEqual,
    totalOrder, totalOrderMag,
    minNum, maxNum, minNumMag, maxNumMag,
    # extensions
    minmax, minmaxMag, maxmin, maxminMag,
    # ulpufp
    epsilon, eta, ulp, ufp, sulp, sufp,
    # QNaN
    qnan


end # module
