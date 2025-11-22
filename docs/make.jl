using Documenter, Measurements

makedocs(
    modules = [Measurements],
    sitename = "Measurements",
    pages    = [
        "Introduction" => "index.md",
        "Installation" => "installation.md",
        "Usage"        => "usage.md",
        "Examples"     => "examples.md",
        "Performance"  => "performance.md",
        "Development"  => "todo.md",
        "Appendix"     => "appendix.md",
    ],
)

deploydocs(
    ;
    repo = "github.com/JuliaPhysics/Measurements.jl.git",
    devbranch = "main",
    target = "build",
    deps = nothing,
    make = nothing,
)
