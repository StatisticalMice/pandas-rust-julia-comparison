using DataFrames, CSV, BenchmarkTools

function task_one()
    println("Read 25xtrain.csv as a DataFrame and print its size.") # I left this here intentionally to show how many times it's executed.
    df = DataFrame(CSV.File("25xtrain.csv"; types=Dict(:pickup_latitude => Float32, :pickup_longitude => Float32, :dropoff_longitude => Float32, :dropoff_latitude => Float32, :vendor_id => Int8, :passenger_count => Int8, :trip_duration => Int32), dateformat="y-m-d H:M:S"))
    size(df)
end
println("Exploring the performance of Julia in the tasks of https://studioterabyte.nl/en/blog/polars-vs-pandas")
@btime task_one()

println("Read 25xtrain.csv as a DataFrame and keep that for the rest of the tasks.")
df = DataFrame(CSV.File("25xtrain.csv"; types=Dict(:pickup_latitude => Float32, :pickup_longitude => Float32, :dropoff_longitude => Float32, :dropoff_latitude => Float32, :vendor_id => Int8, :passenger_count => Int8, :trip_duration => Int32), dateformat="y-m-d H:M:S"))
function task_two(df)
    first(df, 5)
end
println("Show the first five rows.")
@btime task_two(df)
print(task_two(df))
