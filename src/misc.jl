using Base: Broadcast.DefaultArrayStyle, AbstractUnitRange

_broadcasted(style, f, x, r::AbstractRange) = invoke(Base.Broadcast.broadcasted, Tuple{typeof(style),typeof(f),Any,typeof(r)}, style, f, x, r)
_broadcasted(style, f, r::AbstractRange, x) = invoke(Base.Broadcast.broadcasted, Tuple{typeof(style),typeof(f),typeof(r),Any}, style, f, r, x)

for f in (+, -, *, /, \), R in (AbstractRange, AbstractUnitRange, StepRangeLen)
    @eval begin
        Base.Broadcast.broadcasted(style::DefaultArrayStyle{1}, ::typeof($f), x::Measurement, r::$R) = _broadcasted(style, $f, x, r)
        Base.Broadcast.broadcasted(style::DefaultArrayStyle{1}, ::typeof($f), r::$R, x::Measurement) = _broadcasted(style, $f, r, x)
    end
end
