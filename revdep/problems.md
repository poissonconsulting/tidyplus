# fwatlasbc

<details>

* Version: 0.0.1.9018
* GitHub: NA
* Source code: https://github.com/cran/fwatlasbc
* Number of recursive dependencies: 131

Run `revdepcheck::revdep_details(, "fwatlasbc")` for more info

</details>

## Newly broken

*   checking dependencies in R code ...sh: line 1: 35877 Segmentation fault: 11  R_DEFAULT_PACKAGES=NULL '/Library/Frameworks/R.framework/Resources/bin/R' --vanilla --no-echo 2>&1 < '/var/folders/yr/tq_q43k50m795hb4y0njhyth0000gn/T//RtmpsdZi88/file8a3169fd0cf7'
    ```
     NOTE
    
     *** caught segfault ***
    address 0x6c69662068637573, cause 'invalid permissions'
    
    Traceback:
     1: dyn.load(file, DLLpath = DLLpath, ...)
     2: library.dynam(lib, package, package.lib)
     3: loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]])
     4: namespaceImport(ns, loadNamespace(i, c(lib.loc, .libPaths()),     versionCheck = vI[[i]]), from = package)
    ...
     6: withCallingHandlers(expr, message = function(c) if (inherits(c,     classes)) tryInvokeRestart("muffleMessage"))
     7: suppressMessages(loadNamespace(p))
     8: withCallingHandlers(expr, warning = function(w) if (inherits(w,     classes)) tryInvokeRestart("muffleWarning"))
     9: suppressWarnings(suppressMessages(loadNamespace(p)))
    10: doTryCatch(return(expr), name, parentenv, handler)
    11: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    12: tryCatchList(expr, classes, parentenv, handlers)
    13: tryCatch(suppressWarnings(suppressMessages(loadNamespace(p))),     error = function(e) e)
    14: tools:::.check_packages_used(package = "fwatlasbc")
    An irrecoverable exception occurred. R is aborting now ...
    ```

## Newly fixed

*   checking dependencies in R code ...sh: line 1: 35876 Segmentation fault: 11  R_DEFAULT_PACKAGES=NULL '/Library/Frameworks/R.framework/Resources/bin/R' --vanilla --no-echo 2>&1 < '/var/folders/yr/tq_q43k50m795hb4y0njhyth0000gn/T//RtmpxbUN9R/file8a0e692feb49'
    ```
     NOTE
    
     *** caught segfault ***
    address 0x6c69662068637573, cause 'invalid permissions'
    
    Traceback:
     1: dyn.load(file, DLLpath = DLLpath, ...)
     2: library.dynam(lib, package, package.lib)
     3: loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]])
     4: namespaceImport(ns, loadNamespace(i, c(lib.loc, .libPaths()),     versionCheck = vI[[i]]), from = package)
    ...
     6: withCallingHandlers(expr, message = function(c) if (inherits(c,     classes)) tryInvokeRestart("muffleMessage"))
     7: suppressMessages(loadNamespace(p))
     8: withCallingHandlers(expr, warning = function(w) if (inherits(w,     classes)) tryInvokeRestart("muffleWarning"))
     9: suppressWarnings(suppressMessages(loadNamespace(p)))
    10: doTryCatch(return(expr), name, parentenv, handler)
    11: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    12: tryCatchList(expr, classes, parentenv, handlers)
    13: tryCatch(suppressWarnings(suppressMessages(loadNamespace(p))),     error = function(e) e)
    14: tools:::.check_packages_used(package = "fwatlasbc")
    An irrecoverable exception occurred. R is aborting now ...
    ```

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘fwatlasbc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fwa_snap_rm_to_point
    > ### Title: Snap River Meter to Point
    > ### Aliases: fwa_snap_rm_to_point
    > 
    > ### ** Examples
    > 
    > rm <- fwa_add_rms_to_blk(data.frame(blk = 356308001))
    Error in dyn.load(file, DLLpath = DLLpath, ...) : 
      unable to load shared object '/Users/aylapearson/Code/poissonconsulting/tidyplus/revdep/library.noindex/fwatlasbc/sf/libs/sf.so':
      dlopen(/Users/aylapearson/Code/poissonconsulting/tidyplus/revdep/library.noindex/fwatlasbc/sf/libs/sf.so, 0x0006): Library not loaded: /opt/homebrew/opt/gdal/lib/libgdal.35.dylib
      Referenced from: <B3C52CEF-2342-3A59-91CF-87D7351AE823> /Users/aylapearson/Code/poissonconsulting/tidyplus/revdep/library.noindex/fwatlasbc/sf/libs/sf.so
      Reason: tried: '/opt/homebrew/opt/gdal/lib/libgdal.35.dylib' (no such file), '/System/Volumes/Preboot/Cryptexes/OS/opt/homebrew/opt/gdal/lib/libgdal.35.dylib' (no such file), '/opt/homebrew/opt/gdal/lib/libgdal.35.dylib' (no such file), '/Library/Frameworks/R.framework/Resources/lib/libgdal.35.dylib' (no such file), '/Library/Java/JavaVirtualMachines/jdk-11.0.18+10/Contents/Home/lib/server/libgdal.35.dylib' (no such file), '/opt/homebrew/Cellar/gdal/3.10.1/lib/libgdal.35.dylib' (no such file), '/System/Volumes/Preboo
    Calls: fwa_add_rms_to_blk ... <Anonymous> -> loadNamespace -> library.dynam -> dyn.load
    Execution halted
    ```

*   checking tests ...
    ```
      Running ‘testthat.R’/Library/Frameworks/R.framework/Resources/bin/BATCH: line 60: 36511 Segmentation fault: 11  ${R_HOME}/bin/R -f ${in} ${opts} ${R_BATCH_OPTIONS} > ${out} 2>&1
    
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      27: tryCatch(withCallingHandlers({    eval(code, test_env)    if (!handled && !is.null(test)) {        skip_empty()    }}, expectation = handle_expectation, skip = handle_skip, warning = handle_warning,     message = handle_message, error = handle_error), error = handle_fatal,     skip = function(e) {    })
      28: test_code(test = NULL, code = exprs, env = env, reporter = get_reporter() %||%     StopReporter$new())
      29: source_file(path, env = env(env), desc = desc, error_call = error_call)
      30: FUN(X[[i]], ...)
      31: lapply(test_paths, test_one_file, env = env, desc = desc, error_call = error_call)
    ...
      32: doTryCatch(return(expr), name, parentenv, handler)
      33: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      34: tryCatchList(expr, classes, parentenv, handlers)
      35: tryCatch(code, testthat_abort_reporter = function(cnd) {    cat(conditionMessage(cnd), "\n")    NULL})
      36: with_reporter(reporters$multi, lapply(test_paths, test_one_file,     env = env, desc = desc, error_call = error_call))
      37: test_files_serial(test_dir = test_dir, test_package = test_package,     test_paths = test_paths, load_helpers = load_helpers, reporter = reporter,     env = env, stop_on_failure = stop_on_failure, stop_on_warning = stop_on_warning,     desc = desc, load_package = load_package, error_call = error_call)
      38: test_files(test_dir = path, test_paths = test_paths, test_package = package,     reporter = reporter, load_helpers = load_helpers, env = env,     stop_on_failure = stop_on_failure, stop_on_warning = stop_on_warning,     load_package = load_package, parallel = parallel)
      39: test_dir("testthat", package = package, reporter = reporter,     ..., load_package = "installed")
      40: test_check("fwatlasbc")
      An irrecoverable exception occurred. R is aborting now ...
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 15 marked UTF-8 strings
    ```

