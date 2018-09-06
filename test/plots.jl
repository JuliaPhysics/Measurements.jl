using RecipesBase

x = [x ± x/10 for x in 0:0.1:10];
y = sin.(x);

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), y)
@test rec[1].plotattributes == Dict{Symbol, Any}(:yerror => uncertainty.(y))
@test rec[1].args == (value.(y),)

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), sin, x)
@test rec[1].plotattributes == Dict{Symbol, Any}(:xerror => uncertainty.(x),
                                    :yerror => uncertainty.(y))
@test rec[1].args == (value.(x), value.(y))


rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), x, y)
@test rec[1].plotattributes == Dict{Symbol, Any}(:xerror => uncertainty.(x),
                                    :yerror => uncertainty.(y))
@test rec[1].args == (value.(x), value.(y))

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), x, value.(y))
@test rec[1].plotattributes == Dict{Symbol, Any}(:xerror => uncertainty.(x))
@test rec[1].args == (value.(x), value.(y))

rec = RecipesBase.apply_recipe(Dict{Symbol, Any}(), value.(x), y)
@test rec[1].plotattributes == Dict{Symbol, Any}(:yerror => uncertainty.(y))
@test rec[1].args == (value.(x), value.(y))
