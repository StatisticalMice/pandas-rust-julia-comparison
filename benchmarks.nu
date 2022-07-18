
def task-one [] {
    print "Read 25xtrain.csv as a DataFrame and print its size."
    let df = (open-df 25xtrain.csv)
    print ($df | shape)
}

benchmark { task-one }

print "Read 25xtrain.csv as a DataFrame and keep that for the rest of the tasks."
let df = (open-df 25xtrain.csv)

print "Show the first five rows."
benchmark { $df | first 5 }
$df | first 5

