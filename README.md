# PrintLog

An incredibly simple logger!
All it does is to log all outputs of `print` and `println` into a file.

Usage:
```julia
julia> using PrintLog

julia> @printlog "junk.log"
INFO: `print` and `println` will be logged into file `bf.log`

julia> println("junk")
junk

julia> @noprintlog
INFO: `print` and `println` are resumed.

julia> println("junk")
junk
```
And here is what `junk.log` looks like:
```txt
junk
```

---
Created by Zhizhong Li.
