
## loon.ggplot  <img src="man/figures/logo.png" align="right" width="120" />

[![Build Status](https://travis-ci.org/z267xu/loon.ggplot.svg?branch=master)](https://travis-ci.org/z267xu/loon.ggplot)
[![Codecov test coverage](https://codecov.io/gh/z267xu/loon.ggplot/branch/master/graph/badge.svg)](https://codecov.io/gh/z267xu/loon.ggplot?branch=master)

An R package to turn ggplot graphic data structures into interactive loon plots


Documentation: [https://great-northern-diver.github.io/loon.ggplot/](https://great-northern-diver.github.io/loon.ggplot/)

### Introduction

The `ggplot2` graphics package (part of the `tidyverse` package collection) uses the base `grid` graphics package to produce publication quality graphics for data analysis.  Based on a grammar for graphics, `ggplot2` also provides a lot of functionality (e.g. `facet`s) that can be extremely useful in data analysis.

The `loon` graphics package provides **interactive** graphics especially valuable in any **exploratory data analysis**.  This includes programmatic and direct manipulation of the visualizations to effect interactive identification, zooming, panning, and linking between any number of displays. Of course, `loon` also provides publication quality static graphics in `grid` via loon's functions `grid.loon()` and `loonGrob()`.


The loon.ggplot package brings **both these packages together**. Data analysts who value the ease with which `ggplot2` can create meaningful graphics can now turn these `ggplot`s into interactive `loon` plots for more dynamic interaction with their data.  Conversely,  data analysts who explore data interactively can at any time turn a snapshot of their interactive `loon` plots into `ggplot`s.   The former is accomplished by the simple translation function **`ggplot2loon()`** and the latter by the simple translation function **`loon2ggplot()`**.

### Install

`loon.ggplot` can be achieved directly from github repo

```
remotes::install_github("https://github.com/great-northern-diver/loon.ggplot")
```

Launch R, then install the required package dependencies

```
install.packages("ggplot2")
install.packages("loon")
```

### Basic

#### `ggplot2loon()`: ggplot --> loon

* Construct `ggplot`

Consider the `mtcars` data set. Suppose we draw a scatterplot of the mileage `mpg` (miles per US gallon) versus the weight of the car `wt` in thousands of pounds and colour represents different cylinder numbers. In `ggplot2` this would be constructed as

```
library(ggplot2)
p <- ggplot(mtcars, aes(wt, mpg, colour = as.factor(cyl))) + geom_point()
p
```
![](man/figures/mtcarsScatterPlot.png)

We might also display a histogram of some other variate, say the engine's horsepower `hp`.  In `ggplot2` this would be constructed as
```
h <- ggplot(mtcars, aes(x = hp, fill = as.factor(cyl))) + geom_histogram()
h
```
![](man/figures/hpHistogram.png)

* To `loon`

the `"ggplot"` data structures `p` and `h` can be **turned into an interactive loon plot** using the `ggplot2loon()` function:

```
library(loon.ggplot)
pl <- ggplot2loon(p)
hl <- ggplot2loon(h)
```
![](man/figures/scatterAndHist.gif)

Note that:

  + Loon "Hello World": Introduction to interactive `loon` plots can be found via  [loon](https://cran.r-project.org/web/packages/loon/vignettes/introduction.html). It shows how to create, manipulate (selection, linking and etc) `loon` plots
    
  + `loon.ggplot` talk: A talk "Interactive ggplots in R" has been given in [SDSS 2019](https://ww2.amstat.org/meetings/sdss/2019/onlineprogram/AbstractDetails.cfm?AbstractID=306216). Slides can be found in [SDSS2019/loon.ggplot talk](https://www.math.uwaterloo.ca/~rwoldfor/talks/SDSS2019/loon.ggplot/assets/player/KeynoteDHTMLPlayer.html) which gives more details.
  
  + `ggmatrix` object in package `GGally` can also be converted to `loon` widget. See `help(ggplot2loon)` for more info.

#### `loon2ggplot()`: loon --> ggplot

After creating `loon` plots and adding programmatic and direct manipulation of the visualizations to effect interactive identification, function `loon2ggplot` can be applied to return a static `ggplot`

```
pg <- loon2ggplot(pl)
hg <- loon2ggplot(hl)
```

Note that `pg` and `hg` are `ggplot` objects. 

```
class(pg)
[1] "gg"     "ggplot"
class(hg)
[1] "gg"     "ggplot"
```

Layers, theme adjustment can be piped though like:

```
pg + 
  ggplot2::geom_smooth() + 
  ggplot2::ggtitle("Mtcars")
```
![](man/figures/mtcarsAddSmooth.png)

```
hg + 
  ggplot2::geom_density() + 
  ggplot2::coord_flip()
```
![](man/figures/hpAddDensity.png)

Note that:

  + Compound loon widget like `l_ts` and `l_pairs` are created by `ggmatrix` in `GGally`. Ggplot features like `theme`, `labels` can be piped through but by  [`ggmatrix`](https://mran.microsoft.com/snapshot/2016-01-21/web/packages/GGally/vignettes/ggmatrix.html) rule.
  
  + Some functionalities are provided 
    * Adding glyphs on scatterplot like `geom_serialAxesGlyph()`, `geom_polygonGlyph()`, `geom_imageGlyph()` and etc.
    * Providing serial axes plots (parallel coordinate and radial coordinate) via `ggSerialAxes()`

#### `loon.ggplot()`: loon <--> ggplot 

`loon.ggplot()` gathers features of both `loon2ggplot()` and `ggplot2loon()`. It can take either a `loon` widget or `gg` object and transform back and forth.

```
p <- l_plot(iris)
# `loon` to `gg`
g <- loon.ggplot(p)
g <- g + geom_smooth(method = "lm") + theme_bw() 
g
# `gg` to `loon`
l <- loon.ggplot(g)
```
