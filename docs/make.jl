using Documenter, Measurements

makedocs(
    modules = [Measurements],
    format = :html,
    sitename = "Measurements",
    pages    = Any[
        "Introduction" => "index.md",
        "Installation" => "installation.md",
        "Usage"        => "usage.md",
        "Examples"     => "examples.md",
        "Performance"  => "performance.md",
        "Development"  => "todo.md",
        "Appendix"     => "appendix.md",
    ]
)

deploydocs(
    repo = "github.com/JuliaPhysics/Measurements.jl.git",
    target = "build",
    deps = nothing,
    make = nothing,
)
