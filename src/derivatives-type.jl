### derivatives-type.jl
#
# Copyright (C) 2016, 2017 Mosè Giordano.
#
# Maintainer: Mosè Giordano <mose AT gnu DOT org>
# Keywords: uncertainty, error propagation, physics
#
# This file is a part of Measurements.jl.
#
# License is MIT "Expat".
#
### Commentary:
#
# This file containes the definition of Derivatives type.  This is borrowed from
# Base.ImmutableDict type (see base/dict.jl in Julia source code), introduced in
# Julia 0.5.  `get' and `getindex' have methods different from those of the
# standard Base.ImmutabileDict, otherwise Derivatives and Base.ImmutableDict
# would be identical.
#
### Code:

import Base: getindex, get, start, next, done, length

struct Derivatives{T} <: Associative{Tuple{T,T,Float64},T}
    parent::Derivatives{T}
    key::Tuple{T,T,Float64}
    value::T
    Derivatives{T}() where {T} = new() # represents an empty dictionary
    Derivatives{T}(parent::Derivatives, key, value) where {T} = new(parent, key, value)
end

Derivatives(t::Derivatives{T}, KV::Pair) where {T} = Derivatives{T}(t, KV[1], KV[2])

function getindex(dict::Derivatives, key)
    while isdefined(dict, :parent)
        # We want to compare the three elements of the key tuples.  In order to allow for
        # calculations involving NaNs we need to use `isequal` for comparing the first two
        # elements, then we can use `==` to compare the tag.  Since `==` is faster than
        # `isequal`, we first compare the last element and then the other two.  This is the
        # only difference with the plain Base.ImmutableDict type.  The same in `get'.
        dict.key[3] == key[3] && isequal(dict.key[1], key[1]) &&
            isequal(dict.key[2], key[2]) && return dict.value
        dict = dict.parent
    end
    throw(KeyError(key))
end
function get(dict::Derivatives, key, default)
    while isdefined(dict, :parent)
        # See comment in `getindex'.
        dict.key[3] == key[3] && isequal(dict.key[1], key[1]) &&
            isequal(dict.key[2], key[2]) && return dict.value
        dict = dict.parent
    end
    return default
end

# this actually defines reverse iteration (e.g. it should not be used for merge/copy/filter type operations)
start(t::Derivatives) = t
next(::Derivatives{T}, t) where {T} = (Pair{Tuple{T,T,Float64},T}(t.key, t.value), t.parent)
done(::Derivatives, t) = !isdefined(t, :parent)
length(t::Derivatives) = count(x->true, t)
