
# ggPyramid

<!-- badges: start -->

![errero](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
<img src="imgs/logo_infinito.png" width="50"/>
[![Open Source Love](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)
![LinuxMint](https://img.shields.io/badge/Linux_Mint-87CF3E?style=for-the2-badge&logo=linux-mint&logoColor=white)

<!-- badges: end -->

[**ggPyramid**](https://github.com/musajajorge/ggPyramid/) is a package that facilitates the elaboration of population pyramids.

## Installation :arrow_double_down:

Install **ggPyramid**:

``` r
library(remotes)
install_github("musajajorge/ggPyramid")
```

## Usage :muscle:

### Peru's population pyramid, year 2021

Using the default parameters.

``` r
df <- popPyramid::popPER
df <- dplyr::filter(df, Year==2021)
library(popPyramid)
plotPyramid(df=df, age="gAge", sex="Sex", pop="Population")
```

<img src="imgs/ex1.png" width="100%" />

### Peru's population pyramid, year 2021

Modifying the colors, X and Y axis labels, as well as the rotation of the X axis labels.

``` r
df <- popPyramid::popPER
df <- dplyr::filter(df, Year==2021)
library(popPyramid)
plotPyramid(df=df, age="gAge", sex="Sex", pop="Population",
            labx="Personas", laby="Grupo de edad",
            twocolors=c("steelblue","violetred3"),
            rotation=45, n.breaks=15, value.labels=FALSE)
```

<img src="imgs/ex2.png" width="100%" />

### Peru's population pyramid, year 2021

Modifying the position of the values in the bars.

``` r
df <- popPyramid::popPER
df <- dplyr::filter(df, Year==2021)
library(popPyramid)
plotPyramid(df=df, age="gAge", sex="Sex", pop="Population",
            value.labels=TRUE, position.value.labels = "out",
            size.value.labels=4)
```

<img src="imgs/ex3.png" width="100%" />

### Percentage pyramid of Peru's population, year 2021

Using the default parameters.

``` r
df <- popPyramid::popPER
df <- dplyr::filter(df, Year==2021)
df <- percDF(df, "gAge", "Sex", "Population")
library(popPyramid)
plotPercPyramid(df=df, age="gAge", sex="Sex", perpop="perc_Population")
```

<img src="imgs/ex4.png" width="100%" />

### Percentage pyramid of Peru's population, year 2021

Modifying the position of the values on the bars, the X and Y axis labels and the colors of the bars.

``` r
df <- popPyramid::popPER
df <- dplyr::filter(df, Year==2021)
df <- percDF(df, "gAge", "Sex", "Population")
library(popPyramid)
plotPercPyramid(df=df, age="gAge", sex="Sex", perpop="perc_Population",
                labx="% Personas", laby="Grupo de edad", n.breaks=10,
                twocolors=c("steelblue","violetred3"),
                value.labels=TRUE, position.value.labels="out",
                size.value.labels=4)
```

<img src="imgs/ex5.png" width="100%" />

------------

<p align="center">
    <img src="imgs/item_infinito.png" width="40%">
</p>
