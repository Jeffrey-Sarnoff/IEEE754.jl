module SignificantBits

import Base: significand_mask, trailing_ones

export significand_bits, # explicit 
       significant_bits  # implicit = explicit + 1

# how many bits are present in the encoded significand (excludes the hidden bit)
significand_bits(::Type{Float64}) = trailing_ones(significand_mask(Float64))
significand_bits(::Type{Float32}) = trailing_ones(significand_mask(Float32))
significand_bits(::Type{Float16}) = trailing_ones(significand_mask(Float16))

# how many bits are represented with the significand (includes the hidden bit)
significant_bits(::Type{Float64}) = 1+significand_bits(Float64)
significant_bits(::Type{Float32}) = 1+significand_bits(Float32)
significant_bits(::Type{Float16}) = 1+significand_bits(Float16)

end # SignificantBits
