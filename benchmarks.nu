# Some code from https://gist.github.com/fdncred/5809a1b55b30bfea255d0f27adecb779

print "Read 25xtrain.csv as a DataFrame and print its size."
benchmark { open-df 25xtrain.csv }

print "Read 25xtrain.csv as a DataFrame and keep that for the rest of the tasks."
let df = (open-df 25xtrain.csv)
print ($df | shape)

print "Show the first five rows."
benchmark { $df | first 5 }
$df | first 5

print "Get the lengths of all strings in the "id" column, show the first five (alternative A)"
do {
    let id-lengths = ($df | get id | str-lengths)
    $df | append $id-lengths | rename id_x vendor_id_length | first 5
}
benchmark {
    let id-lengths = ($df | get id | str-lengths)
    $df | append $id-lengths | rename id_x vendor_id_length | first 5
}

print "Get the lengths of all strings in the "id" column, show the first five (alternative B)"
$df | with-column ($df | get id | str-lengths) --name vendor_id_length | first 5
benchmark { $df | with-column ($df | get id | str-lengths) --name vendor_id_length | first 5 }

$df | with-column [((col trip_duration) / 60.0 | as "trip_duration_minutes") ] | first 5 
benchmark { $df | with-column [((col trip_duration) / 60.0 | as "trip_duration_minutes") ] | first 5  }
