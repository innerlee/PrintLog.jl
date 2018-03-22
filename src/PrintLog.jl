module PrintLog

import Suppressor.@suppress

export @printlog, @noprintlog

"""
    @printlog "file.log"

Enable `printlog`.
Outputs of `print` and `println` will be logged into file `file.log`.
It will create the log file if it does not exist.
All prints will be appended to the end of the file.

    @printlog "file.log" silent

Silent mode.
Do not output `info`.
"""
macro printlog(file, silent=false)
    @eval begin
        import Base.println, Base.print, Suppressor.@suppress
        @suppress Base.println(xs...) =
            open(f -> (println(f, xs...); println(STDOUT, xs...)), $file, "a")
        @suppress Base.print(xs...) =
            open(f -> (print(f, xs...); print(STDOUT, xs...)), $file, "a")
    end
    silent != :silent &&
        info("`print` and `println` will be logged into file `$file`")
    nothing
end

"""
    @noprintlog

Disable `printlog`.

    @noprintlog silent

Silent mode.
"""
macro noprintlog(silent=false)
    @eval begin
        import Base.println, Base.print, Suppressor.@suppress
        @suppress Base.println(xs...) = println(STDOUT, xs...)
        @suppress Base.print(xs...) = print(STDOUT, xs...)
    end
    silent != :silent &&
        info("`print` and `println` are resumed.")
    nothing
end

end # module
