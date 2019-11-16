# dsLib

[![Build Status](https://travis-ci.org/joseah/dsLib.svg?branch=master)](https://travis-ci.org/joseah/dsLib)

`dsLib` (data-science library) is designed to facilite common and necessary tasks which are currently missing or not automated in other packages. This package tries to provide functions to improve and facilite the reproducibility and efficiency of data analysis by examining and returning the following information from script or set of code instructions:

- Computing time
- Memory usage
- Versions of code (from Git) and R session information

# Computing time and memory usage

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

By using the pair `inicio()` / `fin()` it is possible to locally monitor the memory usage and execution time from a script. Furthermore, it may be used as a proxy to track the code location resulting on an error after the execution of a script.

# R/git session info

`print_session()` provides the git status of the last commit (if git is being used for version control) along with the current R session information.

Example:

```r
print_session()
```
The first output section corresponds to the information of the last commit:

```
- Git details:
Commit: b183f61f6deb060ad4e1b9b823305e13ae82d599
Message: fixes CHECK errors from documentation
name:  joseah
email: alquicirajose@gmail.com
when:  2019-10-17 13:44:55
```

The next section is the R session details obtained via `devtools::session_info()`

```
─ Session info ──────────────────────────────────────────────────────────────
 setting  value                       
 version  R version 3.6.0 (2019-04-26)
 os       macOS Mojave 10.14.6        
 system   x86_64, darwin15.6.0        
 ui       RStudio                     
 language (EN)                        
 collate  en_AU.UTF-8                 
 ctype    en_AU.UTF-8                 
 tz       Australia/Sydney            
 date     2019-10-18                  

─ Packages ──────────────────────────────────────────────────────────────────
 package     * version date       lib source        
 assertthat    0.2.1   2019-03-21 [1] CRAN (R 3.6.0)
 backports     1.1.4   2019-04-10 [1] CRAN (R 3.6.0)
 callr         3.3.1   2019-07-18 [1] CRAN (R 3.6.0)
 cli           1.1.0   2019-03-19 [1] CRAN (R 3.6.0)
 codetools     0.2-16  2018-12-24 [1] CRAN (R 3.6.0)
 crayon        1.3.4   2017-09-16 [1] CRAN (R 3.6.0)
 desc          1.2.0   2018-05-01 [1] CRAN (R 3.6.0)
 devtools      2.1.0   2019-07-06 [1] CRAN (R 3.6.0)
 digest        0.6.20  2019-07-04 [1] CRAN (R 3.6.0)
 dsLib         0.1.0   2019-10-17 [1] local         
 fs            1.3.1   2019-05-06 [1] CRAN (R 3.6.0)
 git2r         0.26.1  2019-06-29 [1] CRAN (R 3.6.0)
 glue          1.3.1   2019-03-12 [1] CRAN (R 3.6.0)
 here          0.1     2017-05-28 [1] CRAN (R 3.6.0)
 magrittr      1.5     2014-11-22 [1] CRAN (R 3.6.0)
 memoise       1.1.0   2017-04-21 [1] CRAN (R 3.6.0)
 pkgbuild      1.0.3   2019-03-20 [1] CRAN (R 3.6.0)
 pkgload       1.0.2   2018-10-29 [1] CRAN (R 3.6.0)
 prettyunits   1.0.2   2015-07-13 [1] CRAN (R 3.6.0)
 processx      3.4.1   2019-07-18 [1] CRAN (R 3.6.0)
 pryr          0.1.4   2018-02-18 [1] CRAN (R 3.6.0)
 ps            1.3.0   2018-12-21 [1] CRAN (R 3.6.0)
 R6            2.4.0   2019-02-14 [1] CRAN (R 3.6.0)
 Rcpp          1.0.2   2019-07-25 [1] CRAN (R 3.6.0)
 remotes       2.1.0   2019-06-24 [1] CRAN (R 3.6.0)
 rlang         0.4.0   2019-06-25 [1] CRAN (R 3.6.0)
 rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.6.0)
 rstudioapi    0.10    2019-03-19 [1] CRAN (R 3.6.0)
 sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.6.0)
 stringi       1.4.3   2019-03-12 [1] CRAN (R 3.6.0)
 stringr       1.4.0   2019-02-10 [1] CRAN (R 3.6.0)
 testthat      2.2.1   2019-07-25 [1] CRAN (R 3.6.0)
 tictoc        1.0     2014-06-17 [1] CRAN (R 3.6.0)
 usethis       1.5.1   2019-07-04 [1] CRAN (R 3.6.0)
 withr         2.1.2   2018-03-15 [1] CRAN (R 3.6.0)

[1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```

The output from `print_session()` is shown in the R terminal and printed to a file called `session.info`. The output path of this file is the current working directory.

# Plotting with ggplot2

## Rotate x-axis labels

The `rotate_x()` function allows to rotate the x-axis lables by default by 90 degrees. This function is shorter and more intuitive than rotating the labels via `element_text(angle = angle, hjust = 1)` within the `theme` function.

## Remove legend

The function `no_legend()` removes the legend automatically if added after the theme set-up.

An example on `rotate_x()` and `no_legend()` is shown below:


```r
library("ggplot2")
library("dsLib")

ggplot(iris, aes(Species, Sepal.Length, fill = Species)) +
    geom_boxplot() +
    theme_classic() +
    scale_fill_brewer(palette =  "Set1") +
    rotate_x() +
    no_legend()
```

# Miscellaneous

## String concatenation

To facilitate the concatenation of strings, `dsLib` provides the `%p%` operator.

Example:

```r
"ACG" %p% "TCG" %p% "CCC"
```
Output:

```
[1] "ACGTCGCCC"
```

`%p%` is a wrapper for `paste0()` but allows the flexibility of using the function as an operator.

## Get a "glance" from an R object

Sometimes, it is ideal to explore the first dimensions of an object to have an idea about its content. Although `head()`, `str()` and `glimpse()` are some options, they provide more information than needed and/or are greatly verbose.

The function `glance()` subsets the first `n` elements in `m` dimensions from a vector, matrix, Matrix::Matrix, list, or data.frame.

Example:

```r
glance(Seurat::pbmc_small@raw.data)
```

Output:

```
5 x 5 sparse Matrix of class "dgTMatrix"
        ATGCCAGAACGACT CATGGCCTGTGCAT GAACCTGATGAACC TGACTGGATTCTCA AGTCAGACTGCACA
MS4A1                .              .              .              .              .
CD79B                1              .              .              .              .
CD79A                .              .              .              .              .
HLA-DRA              .              1              .              .              1
TCL1A                .              .              .              .              .
```

`glance()` returns the first 5 rows and columns from a sparse Matrix object. Unlike `head()`, `glance()` operates in all dimensions of the object.






