
function do_pass()
    # pass
end

function inline_pass()
    # pass
end

function indexing()::Int64
    sum = 0
    a::Array{Int64} = []
    for i in (0:10-1)
        push!(a, i)
        sum += a[i+1]
    end
    return sum
end

function infer_bool(code::Int64)::Bool
    return code in [1, 2, 4]
end

function show()
    a1 = 10
    b9 = 2
    b2 = 2
    @assert(b2 == b9)
    a2::Float64 = 2.1
    println(join([a2], " "))
    for i in (0:10-1)
        println(join([i], " "))
    end
    for i in (0:2:10-1)
        println(join([i], " "))
    end
    a3 = -(a1)
    a4 = (a3 + a1)
    println(join([a4], " "))
    sum1 = indexing()
    println(join([sum1], " "))
    a5 = [1, 2, 3]
    println(join([length(a5)], " "))
    a9::Array{String} = ["a", "b", "c", "d"]
    println(join([length(a9)], " "))
    a6 = Set([1, 2, 3, 4])
    println(join([length(a6)], " "))
    a7 = Dict("a" => 1, "b" => 2)
    println(join([length(a7)], " "))
    a8 = true
    if a8
        println(join(["true"], " "))
    else

        if a4 > 0
            println(join(["never get here"], " "))
        end
    end
    if a1 == 11
        println(join(["false"], " "))
    else

        println(join(["true"], " "))
    end
    if 1 != nothing
        println(join(["World is sane"], " "))
    end
    do_pass()
    inline_pass()
    s = "1    2"
    println(join([s], " "))
end

function main()
    show()
end

main()
