#' Euclidean Algorithm (Greatest Common Divisor)
#'
#' This function computes the greatest common divisor (GCD) of two integers
#' using the Euclidean algorithm. The algorithm repeatedly replaces the
#' remainder until it becomes zero. The last non-zero remainder is the GCD.
#'
#' @param prev The first numeric integer input (usually the larger number).
#' @param remainder The second numeric integer input (usually the smaller number).
#'
#' @return A single numeric integer representing the greatest common divisor
#' of the two provided inputs.
#'
#' @references \url{https://en.wikipedia.org/wiki/Euclidean_algorithm}
#'
#' @examples
#' euclidean(462, 1071)
#'
#' @export
#'
euclidean <- function(prev, remainder)
{

  if(!is.numeric(c(prev, remainder)))
    stop("Expecting a numeric integer")

  while(remainder != 0)
  {
    temp <- remainder
    remainder <- prev %% remainder
    prev <- temp
  }

  return(prev)
}


#' Dijkstra's Algorithm (Shortest Path in Graphs)
#'
#' This function computes the shortest path distances from a starting node
#' to all other nodes in a weighted graph using Dijkstra's algorithm.
#' The graph must be provided as a dataframe with three columns:
#' source node, destination node, and edge weight.
#'
#' @param graph A dataframe with 3 columns: v1 (source), v2 (destination), and w (weight).
#' @param init_node A numeric value representing the starting node for shortest path calculation.
#'
#' @return A numeric vector of shortest path distances from the initial node
#' to all reachable nodes in the graph.
#'
#' @references https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
#'
#' @examples
#' wiki_graph <- data.frame(
#'   v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'   v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'   w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
#' )
#' dijkstra(wiki_graph, 1)
#'
#' @export
#'
dijkstra <- function(graph, init_node)
{

  if((!is.data.frame(graph)) || (ncol(graph) != 3))
    stop("This is not required structure of Dataframe")

  if(!(init_node %in% c(wiki_graph$v1, wiki_graph$v2)))
    stop("Source node is not present in graph")

  if(!is.numeric(init_node))
    stop("Source node is not numeric")

  nodes <- unique(graph$v1)
  names(nodes) <- nodes

  adj <- vector("list", length(nodes))
  names(adj) <- nodes

  for (i in 1:nrow(graph))
    {

    u <- graph$v1[i]
    v <- graph$v2[i]
    w <- graph$w[i]


    if (is.null(adj[[u]]))
      adj[[u]] <- list()

    adj[[u]] <- append(adj[[u]], list(c(v, w)))

  }

  dist <- sapply(nodes, function(v) Inf)
  prev_node <- sapply(nodes, function(v) NA)

  dist[as.character(init_node)] <- 0

  while(length(nodes)>0)
  {
    start_node <- names(nodes[which.min(dist[nodes])])
    nodes <- nodes[names(nodes)!=start_node]

    for(node in adj[[start_node]])
    {
      end_node <- as.character(node[1])
      weight <- as.numeric(node[2])

      if(end_node %in% nodes)

        if((dist[[start_node]] + weight) < dist[[end_node]])
        {
          dist[[end_node]] <- (dist[[start_node]] + weight)
          prev_node[[end_node]] <- start_node
        }
    }

  }

  return(unname(dist))

}



