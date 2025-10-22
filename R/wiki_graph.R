#' Wiki Graph Example Dataset
#'
#' A dataset representing a weighted directed graph. It contains three variables:
#' \itemize{
#'   \item \code{v1} Starting node of an edge
#'   \item \code{v2} Ending node of an edge
#'   \item \code{w}  Weight of the edge between the nodes
#' }
#'
#' The dataset is commonly used to demonstrate Dijkstra's algorithm for finding
#' the shortest paths in a graph.
#'
#' @format A data.frame with 3 columns.
#' @source https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
#'
#' @examples
#' data(wiki_graph)
#' head(wiki_graph)
"wiki_graph"
