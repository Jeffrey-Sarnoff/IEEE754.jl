# faster than builtin, same behavior
minmax{T<:AbstractFloat}(a::T, b::T) = ifelse(a<b, (a,b), ifelse(isnan(b),(a,b),(b,a)))

maxmin{T<:AbstractFloat}(a::T, b::T) = ifelse(a>b, (a,b), ifelse(isnan(b),(a,b),(b,a)))

function minmax{T<:AbstractFloat}(a::T, b::T, c::T)
    b,c = ifelse(b>c,(c,b),(b,c))
    a,c = ifelse(a>c,(c,a),(a,c))
    a,b = ifelse(a>b,(b,a),(a,b)) 
    a,b,c
end

function maxmin{T<:AbstractFloat}(a::T, b::T, c::T)
    b,c = ifelse(b<c,(c,b),(b,c))
    a,c = ifelse(a<c,(c,a),(a,c))
    a,b = ifelse(a<b,(b,a),(a,b)) 
    a,b,c
end

function minmax{T<:AbstractFloat}(a::T,b::T,c::T,d::T)
    a,b = ifelse(a>b,(b,a),(a,b)); c,d = ifelse(c>d,(d,c),(c,d))
    a,c = ifelse(a>c,(c,a),(a,c)); b,d = ifelse(b>d,(d,b),(b,d))
    b,c = ifelse(b>c,(c,b),(b,c)) 
    a,b,c,d
end

function maxmin{T<:AbstractFloat}(a::T,b::T,c::T,d::T)
    a,b = ifelse(a<b,(b,a),(a,b)); c,d = ifelse(c<d,(d,c),(c,d))
    a,c = ifelse(a<c,(c,a),(a,c)); b,d = ifelse(b<d,(d,b),(b,d))
    b,c = ifelse(b<c,(c,b),(b,c)) 
    a,b,c,d
end

function minmax{T<:AbstractFloat}(a::T,b::T,c::T,d::T,e::T)
    a,b = ifelse(a>b,(b,a),(a,b)); d,e = ifelse(d>e,(e,d),(d,e))
    c,e = ifelse(c>e,(e,c),(c,e)) 
    c,d = ifelse(c>d,(d,c),(c,d)); b,e = ifelse(b>e,(e,b),(b,e))
    a,d = ifelse(a>d,(d,a),(a,d)) 
    a,c = ifelse(c>a,(c,a),(a,c)); b,d = ifelse(b>d,(d,b),(b,d))
    b,c = ifelse(b>c,(c,b),(b,c)) 
    a,b,c,d,e
end

function maxmin{T<:AbstractFloat}(a::T,b::T,c::T,d::T,e::T)
    a,b = ifelse(a<b,(b,a),(a,b)); d,e = ifelse(d<e,(e,d),(d,e))
    c,e = ifelse(c<e,(e,c),(c,e)) 
    c,d = ifelse(c<d,(d,c),(c,d)); b,e = ifelse(b<e,(e,b),(b,e))
    a,d = ifelse(a<d,(d,a),(a,d)) 
    a,c = ifelse(c<a,(c,a),(a,c)); b,d = ifelse(b<d,(d,b),(b,d))
    b,c = ifelse(b<c,(c,b),(b,c)) 
    a,b,c,d,e
end

#=
http://pages.ripco.net/~jgamble/nw.html

6
[[1,2],[4,5]]
[[0,2],[3,5]]
[[0,1],[3,4],[2,5]]
[[0,3],[1,4]]
[[2,4],[1,3]]
[[2,3]]

7
[[1,2],[3,4],[5,6]]
[[0,2],[3,5],[4,6]]
[[0,1],[4,5],[2,6]]
[[0,4],[1,5]]
[[0,3],[2,5]]
[[1,3],[2,4]]
[[2,3]]

8
[[0,1],[2,3],[4,5],[6,7]]
[[0,2],[1,3],[4,6],[5,7]]
[[1,2],[5,6],[0,4],[3,7]]
[[1,5],[2,6]]
[[1,4],[3,6]]
[[2,4],[3,5]]
[[3,4]]
=#
