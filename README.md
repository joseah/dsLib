# dsLib

[![Build Status](https://travis-ci.org/joseah/dsLib.svg?branch=master)](https://travis-ci.org/joseah/dsLib)

`dsLib` (data-science library) is designed to facilite common and necessary tasks which are currently missing or not automated in other packages. This package tries to provide functions to improve and facilite the reproducibility and efficiency of data analysis by examining and returning the following information from script or set of code instructions:

- Computing time
- Memory usage
- Versions of code (from Git) and R session information

For example, if we need to track the memory usage and computing time from a chunk of code, `dsLib` provides a simple way to do it as shown below:

```r
inicio("Sleep for 5 seconds")
Sys.sleep(5)
fin()
```

Which returns the following information

```
==>(18/Oct/2019 01:24:24): Sleep for 5 seconds ...
>> Current mem use = 46.8 MB
>> Final mem use = 46.8 MB
>>> Elapsed time: 5.054 secs 
==> DONE!
```

- `inicio()` records the date and time, and prints out an optional message indicating the purpose of the code section. Finally, the memory usage in the current R session is displayed below
- `fin()` calculates the overal difference in memory usage since the execution of `inicio()`. This function also records and prints out the elased time since `inicio()` was run and prints out a _DONE!_ message indicating that the execution of the code section has been finished

By using the pair `inicio()` - `fin()` it is possible to locally monitor the memory usage and execution time from a script. Furthermore, it may be used as a proxy to track the code location resulting on an error after the execution of a script.

