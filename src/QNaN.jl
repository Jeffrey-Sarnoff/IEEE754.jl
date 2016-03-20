module QNaN

export qnan

for (FL, I, UI, UPos, UNeg) in [(:Float64, :Int64, :UInt64, :0x7ff8000000000000, :0xfff8000000000000),
                                (:Float32, :Int32, :UInt32, :0x7fc00000, :0xffc00000),
                                (:Float16, :Int16, :UInt16, :0x7e00, :0xfe00) ]
  @eval begin
      @inline isqnan(x::$(UI))    = (x & $(UPos)) == $(UPos)
      @inline isqnan(x::$(FL))    = isqnan(reinterpret($(UI),x))

      function qnan(si::$(I))
          u = reinterpret($(UI), abs(si))
          if (u > ~$(UNeg)) # 2^51-1
              throw(ArgumentError("The magnitude of n $(si) exceeds available QNaN."))
          end
          u |= ((si > 0) ? $(UPos) : $(UNeg))
          reinterpret($(FL),u)
      end

      function qnan(fp::$(FL))
          u = reinterpret($(UI), fp)
          if !isqnan(u)
              throw(ArgumentError("The value $(fp) ($(u)) is not a QNaN."))
          end
          a = u & ~$(UNeg)
          b =  reinterpret($(I),a)
          (((u & ($(UPos) $ $(UNeg))) == 0) ? b : -b)
      end
  end
end

@doc """
Module QNaN
  qnan(si::{Int16,Int32,Int64}) generates a quiet NaN with a payload of `si`
  qnan(fp::FloatingPoint) recovers the Signed payload from `fp`
""" -> QNaN

@doc """
qnan(`si`::{Int16|32|64}) generates a quiet NaN using `si` for the payload
qnan(`fp`::FloatingPoint) recovers the signed payload from a quiet NaN `fp`
""" -> qnan

end # module
