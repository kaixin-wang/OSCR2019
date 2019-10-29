Advanced Data Manipulation in R
================

Import data:

``` r
library(readr)
input = read_csv("person_info.csv")
input
```

    ## # A tibble: 10 x 14
    ##    first_name last_name birthday    age state  address  City   phone email
    ##    <chr>      <chr>     <chr>     <int> <chr>  <chr>    <chr>  <chr> <chr>
    ##  1 Carol      Davis     9/29/1996    23 Illin… 1674 Ca… Burr … 312-… curt…
    ##  2 Bruno      Horan     6/11/1995    24 Calif… 1561 St… San D… 858-… guad…
    ##  3 William    Moody     2/27/1997    22 Illin… 541 Jad… Arlin… 979-… roos…
    ##  4 Robin      Steel     8/3/1989     57 Texas  1674 Ca… Josep… 214-… lloy…
    ##  5 Michelle   Roberts   7/17/1995    24 Oregon 1372 Ga… "Port… 503-… ben1…
    ##  6 June       Sneed     3/27/2000    19 Arizo… 2411 Cl… Phoen… 256-… kath…
    ##  7 Curtis     Campbell  3/15/1991    28 Idahol 2760 Sc… Pocat… 979-… just…
    ##  8 Dorothy    Schott    1/2/1997     21 Calif… 2742 Su… Santa… 501-… mega…
    ##  9 Mae        Skinner   3/16/1995    24 Penns… <NA>     Newar… 501-… enri…
    ## 10 David      Victoria  8/2/1996     23 Maine  3327 Ch… Harps… 207-… caro…
    ## # ... with 5 more variables: car_1 <chr>, gpa <dbl>, year <chr>,
    ## #   class_of <int>, online_signiture <chr>

Date-time manipulation:

In R, we recommend using the `lubridate` library to for converting data in the format of `day-month-year` to a `datetime` object.

``` r
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following object is masked from 'package:base':
    ## 
    ##     date

``` r
dates <- c("15/02/2013", "15 Feb 13", "It happened on 15 02 '13")
dmy(dates)
```

    ## [1] "2013-02-15" "2013-02-15" "2013-02-15"

``` r
mdy(input$birthday)
```

    ##  [1] "1996-09-29" "1995-06-11" "1997-02-27" "1989-08-03" "1995-07-17"
    ##  [6] "2000-03-27" "1991-03-15" "1997-01-02" "1995-03-16" "1996-08-02"

Note:

There are similar functions for all permutations of `d`, `m` and `y`. Explicitly, all of the following functions exist: `dmy myd ydm mdy dym ymd`.

String manipulation:

-   String normalization:

``` r
library(stringr)
str_trim(" hello world ")
```

    ## [1] "hello world"

``` r
str_trim(" hello world ", side = "left")
```

    ## [1] "hello world "

``` r
str_trim(" hello world ", side = "right")
```

    ## [1] " hello world"

``` r
toupper("Hello world")
```

    ## [1] "HELLO WORLD"

``` r
tolower("Hello World")
```

    ## [1] "hello world"

``` r
input$City[5]
```

    ## [1] "Portland, Oregon(OR), 97217\n\n"

``` r
input$City[5] = str_trim(input$City[5], side = "right")
input$City[5]
```

    ## [1] "Portland, Oregon(OR), 97217"

-   Approximate string matching:

``` r
gender <- c("M", "male ", "Female", "fem.")
grepl("m", gender)
```

    ## [1] FALSE  TRUE  TRUE  TRUE

``` r
grep("m", gender)
```

    ## [1] 2 3 4
