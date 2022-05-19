using LinearAlgebra

function LinearAlgebra.normInf(A::AbstractArray{<:Measurement})
    norm = LinearAlgebra.generic_normInf(A)
    if iszero(norm.val)
        # This is a bit complicated, follow me.  The Inf-norm is the limit of the p-norms,
        # for `p > 1`.  But for `p > 1` we always have `(0 ± u) ^ p == 0 ± 0`, for any value
        # of `u` so the limit is always `0 ± 0`, in particular the uncertainty is always
        # zero.  Therefore, if the the maximum absolute value is zero, then also the
        # uncertainty must be zero, whatever were the other uncertainties.
        return zero(norm)
    end
    return norm
end
