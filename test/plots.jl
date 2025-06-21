using RecipesBase

x = 0 : 0.1 : 10
y = [x_ ± x_/10 for x_ in x]
z = sin.(y)
N = length(x)

RecipesBase.is_key_supported(_) = true

# `(Measurement,)`: default (bar)
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(
    :yerror => uncertainty.(z),
    :uncertainty_plot => :bar
)
@test rec[1].args == (value.(z),)

# `(Measurement,)`: bar
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :bar), z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(
    :yerror => uncertainty.(z),
    :uncertainty_plot => :bar
)
@test rec[1].args == (value.(z),)

# `(Measurement,)`: ribbon
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :ribbon), z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(
    :ribbon => uncertainty.(z),
    :uncertainty_plot => :ribbon
)
@test rec[1].args == (value.(z),)

# `(Measurement,)`: none
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :none), z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:uncertainty_plot => :none)
@test rec[1].args == (value.(z),)

# `(Measurement,)`: unrecognised
@test_throws ErrorException RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :hello), y)

# `(Function, Measurement)`
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), sin, y)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(
    :xerror => uncertainty.(y),
    :yerror => uncertainty.(z)
)
@test rec[1].args == (value.(y), value.(z))

# `(Measurement, Measurement)`
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), y, z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(
    :xerror => uncertainty.(y),
    :yerror => uncertainty.(z)
)
@test rec[1].args == (value.(y), value.(z))

# `(Measurement, Real)`
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), y, value.(z))
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:xerror => uncertainty.(y))
@test rec[1].args == (value.(y), value.(z))

# `(Real, Measurement)`: default (bar)
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), x, z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(
    :uncertainty_plot => :bar,
    :yerror => uncertainty.(z)
)
@test getfield(rec[1], 2) == (value.(x), value.(z))

# `(Real, Measurement)`: bar
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :bar), x, z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(
    :uncertainty_plot => :bar,
    :yerror => uncertainty.(z)
)
@test getfield(rec[1], 2) == (value.(x), value.(z))

# `(Real, Measurement)`: ribbon
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :ribbon), x, z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(
    :uncertainty_plot => :ribbon,
    :ribbon => uncertainty.(z)
)
@test getfield(rec[1], 2) == (value.(x), value.(z))

# `(Real, Measurement)`: none
rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :none), x, z)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:uncertainty_plot => :none)
@test getfield(rec[1], 2) == (value.(x), value.(z))

# `(Real, Measurement)`: unrecognised
@test_throws ErrorException RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :hello), x, z)
