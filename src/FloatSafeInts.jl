module FloatSafeInts

import Base: trailing_ones, significand_mask

export safemax, safemin, isfloatsafe, isintsafe

safemax(::Type{Float64}) = one(Int64) << (1 + trailing_ones(significand_mask(Float64)))
safemax(::Type{Float32}) = one(Int32) << (1 + trailing_ones(significand_mask(Float32)))
safemax(::Type{Float16}) = one(Int16) << (1 + trailing_ones(significand_mask(Float16)))

safemin(::Type{Float64}) = -safemax(Float64)
safemin(::Type{Float32}) = -safemax(Float32)
safemin(::Type{Float16}) = -safemax(Float16)

safemax(::Type{Int64}) = safemax(Float64)
safemax(::Type{Int32}) = safemax(Float32)
safemax(::Type{Int16}) = safemax(Float16)
safemin(::Type{Int64}) = safemin(Float64)
safemin(::Type{Int32}) = safemin(Float32)
safemin(::Type{Int16}) = safemin(Float16)

typealias StdFloat Union{Float64,Float32,Float16}
typealias StdInt   Union{Int64,Int32,Int16}

isfloatsafe{T<:StdInt}(x::T)   = abs(x) < (safemax(T)) + one(T))
isfloatsafe{T<:StdFloat}(x::T) = ((x % 1) == zero(T)) & (abs(x) < (safemax(T)) + one(T))

isintsafe{T<:StdInt}(x::T)     = abs(x) < (safemax(T)) + one(T))
isintsafe{T<:StdFloat}(x::T)   = ((x % 1) == zero(T)) & (abs(x) < (safemax(T)) + one(T))

"""
_safemax(FloatType|IntType)_

The largest positive integer with sizeof() matching given type such that it
and its predecessor interconvert with sizeof matching float exactly.
"""->safemax

"""
_safemin(FloatType|IntType)_

The largest negative integer with sizeof() matching given type such that it
and its predecessor interconvert with sizeof matching float exactly.
"""->safemin

"""
_isfloatsafe(FloatValue|IntValue)_

Tests that the abs(value) and its predecessor interconvert to IntValue|FloatValue exactly.
"""->isfloatsafe

"""
_isintsafe(IntValue|FloatValue)_

Tests that the abs(value) and its predecessor interconvert to FloatValue|IntValue exactly.
"""->isintsafe


end # FloatSafeInts
