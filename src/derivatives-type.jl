### derivatives-type.jl
#
# Copyright (C) 2016 Mosè Giordano.
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
# Julia 0.5.
#
### Code:

import Base: getindex, get, start, next, done, similar

immutable Derivatives{K, V} <: Associative{K,V}
    parent::Derivatives{K, V}
    key::K
    value::V
    Derivatives() = new() # represents an empty dictionary
    Derivatives(key, value) = (empty = new(); new(empty, key, value))
    Derivatives(parent::Derivatives, key, value) = new(parent, key, value)
end

Derivatives{K,V}(KV::Pair{K,V}) = Derivatives{K,V}(KV[1], KV[2])
Derivatives{K,V}(t::Derivatives{K,V}, KV::Pair) = Derivatives{K,V}(t, KV[1], KV[2])

function getindex(dict::Derivatives, key)
    while isdefined(dict, :parent)
        dict.key == key && return dict.value
        dict = dict.parent
    end
    throw(KeyError(key))
end
function get(dict::Derivatives, key, default)
    while isdefined(dict, :parent)
        dict.key == key && return dict.value
        dict = dict.parent
    end
    return default
end

# this actually defines reverse iteration (e.g. it should not be used for merge/copy/filter type operations)
start(t::Derivatives) = t
next{K,V}(::Derivatives{K,V}, t) = (Pair{K,V}(t.key, t.value), t.parent)
done(::Derivatives, t) = !isdefined(t, :parent)
function similar(t::Derivatives)
    while isdefined(t, :parent)
        t = t.parent
    end
    return t
end
