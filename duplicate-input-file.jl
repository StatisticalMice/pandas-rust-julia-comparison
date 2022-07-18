using DataFrames, CSV
df = DataFrame(CSV.File("train.csv"))
repeat!(df, 25)
CSV.write("25xtrain.csv", df)
