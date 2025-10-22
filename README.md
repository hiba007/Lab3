
# lab3

<!-- badges: start -->
[![R-CMD-check](https://github.com/hiba007/Lab3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/hiba007/Lab3/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->


## Installation

You can install the development version of lab3 from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("hiba007/Lab3")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(lab3)
## basic example code
```
## Euclidean Algorithm (GCD)

This function finds the greatest common divisor of two numbers. For example, to find the GCD of 462 and 1071:

``` r
euclidean(462, 1071)
#> [1] 21
```

## Dijkstra's Algorithm (Shortest Path)

This function finds the shortest path from an initial node to all other nodes in a graph. The graph must be provided as a data frame with columns v1 (source), v2 (destination), and w (weight).

Here is an example using the graph from the [Dijkstra's algorithm Wikipedia page](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm):

``` r
# 1. Define the graph data frame
wiki_graph <- data.frame(
   v1 = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6),
   v2 = c(2, 3, 6, 1, 3, 4, 1, 2, 4, 6, 2, 3, 5, 4, 6, 1, 3, 5),
   w  = c(7, 9, 14, 7, 10, 15, 9, 10, 11, 2, 15, 11, 6, 6, 9, 14, 2, 9)
)

# 2. Calculate shortest paths from node 1
shortest_paths <- dijkstra(wiki_graph, 1)

print(shortest_paths)
#> [1]  0  7  9 20 20 11
```
