import Base: precision, ldexp

export epsilon, eta

for F in (:Float64, :Float32, :Float16)
   @eval begin
       epsilon(::Type{$F}) = ldexp(one($F), -precision($F))   # dist from 1 to the next smaller float
       epsilon(x::($F)) = epsilon($F)*x                       # dist from x to next lesser mag float
       eta(::Type{$F}) = nextfloat(zero($F))                  # smallest nonzero subnormal
   end
end
