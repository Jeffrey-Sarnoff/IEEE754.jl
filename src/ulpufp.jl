#=
ACCURATE FLOATING-POINT SUMMATION PART I: FAITHFUL ROUNDING
Siegfried M. Rump, Takeshi Ogita, and Shin'ichi Oishi
in SIAM J. Sci. Comput. Volume 31, Issue 1, pp. 189-224 (2008)

ERROR ESTIMATION OF FLOATING-POINT SUMMATION AND DOT PRODUCT
Siegfried M. Rump
in BIT, May 18, 2011
=#

import Base: precision, ldexp

export epsilon, eta, ufp, ulp, sufp, sulp

for F in (:Float64, :Float32, :Float16)
   @eval begin
       epsilon(::Type{$F}) = ldexp(one($F), -precision($F))     # dist from 1 to the next smaller float
       epsilon(x::($F)) = flipsign(abs(x)-prevfloat(abs(x)),x)  # dist from x to next lesser mag float
       eta(::Type{$F}) = nextfloat(zero($F))                    # smallest nonzero subnormal
       ufp(x::($F)) = ldexp(one($F), floor(Int, log2(abs(x))))  # unit first place
       ulp(x::($F)) = ldexp(one($F), floor(Int, log2(abs(x))) - precision($F)) # unit last place
       sufp(x::($F)) = flipsign(ufp(x),x)                       # signed unit first place
       sulp(x::($F)) = flipsign(ulp(x),x)                       # signed unit last place
   end
end
