# PrintLog

An incredibly simple logger!
All it does is to log all outputs of `print` and `println` into a file.

Usage:
```julia
julia> using PrintLog

julia> @printlog "bf.log"
INFO: `print` and `println` will be logged into file `bf.log`

julia> println("bufan")
bufan

julia> @noprintlog
INFO: `print` and `println` are resumed.

julia> println("fanfan")
fanfan
```
And here is what `bf.log` looks like:
```txt
bufan
```

---
Created by Zhizhong Li.
