using DataFrames, CSV, BenchmarkTools

function task_one()
    println("Read 25xtrain.csv as a DataFrame and print its size.")
    df = DataFrame(CSV.File("25xtrain.csv"))
    size(df)
end
println("Exploring the performance of Julia in the tasks of https://studioterabyte.nl/en/blog/polars-vs-pandas")
@btime task_one()

println("Read 25xtrain.csv as a DataFrame and keep that for the rest of the tasks.")
df = DataFrame(CSV.File("25xtrain.csv"))

function task_two(df)
    first(df, 5)
end
println("Show the first five rows.")
@btime task_two(df)
