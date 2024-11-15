floyd_warshall <- function(graph) {
  # Number of vertices
  V <- nrow(graph)
  
  # Initialize distance matrix
  dist <- graph
  
  # Floyd-Warshall algorithm
  for (k in 1:V) {
    for (i in 1:V) {
      for (j in 1:V) {
        if (dist[i, k] != Inf && dist[k, j] != Inf) {
          dist[i, j] <- min(dist[i, j], dist[i, k] + dist[k, j])
        }
      }
    }
  }
  
  # Print the result
  print("Shortest distances between every pair of vertices:")
  print(dist)
}

# Example graph as an adjacency matrix
INF <- Inf
graph <- matrix(c(0, 3, INF, INF,
                  INF, 0, 1, INF,
                  INF, INF, 0, 7,
                  2, INF, INF, 0),
                nrow = 4, byrow = TRUE)

# Run the Floyd-Warshall algorithm
floyd_warshall(graph)
