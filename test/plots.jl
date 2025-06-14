using RecipesBase

x = [x ± x/10 for x in 0:0.1:10];
y = sin.(x);

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), y)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:yerror => uncertainty.(y))
@test rec[1].args == (value.(y),)

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), sin, x)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:xerror => uncertainty.(x),
                                    :yerror => uncertainty.(y))
@test rec[1].args == (value.(x), value.(y))


rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), x, y)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:xerror => uncertainty.(x),
                                    :yerror => uncertainty.(y))
@test rec[1].args == (value.(x), value.(y))

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), x, value.(y))
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:xerror => uncertainty.(x))
@test rec[1].args == (value.(x), value.(y))

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), value.(x), y)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:yerror => uncertainty.(y))
@test rec[1].args == (value.(x), value.(y))

x = range(0, 6, 301)
y = measurement.(cospi.(x), (5 .+ 2sinpi.(5x))/10)

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :ribbon), y)
@test getfield(rec[1], 2)[1] == value.(y)
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:ribbon => uncertainty.(y))

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(:uncertainty_plot => :ribbon), x, y)
@test rec[1].args == (value.(x), value.(y))
@test getfield(rec[1], 1) == Dict{Symbol, Any}(:ribbon => uncertainty.(y))
