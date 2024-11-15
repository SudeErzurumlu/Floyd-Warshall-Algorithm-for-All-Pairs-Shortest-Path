# Floyd-Warshall Algorithm for All-Pairs Shortest Path
# Author: SudeErzurumlu
# Description: This Python script computes the shortest paths between all pairs of vertices in a weighted graph.

import sys

def floyd_warshall(graph):
    """
    Computes shortest paths between all pairs of vertices using the Floyd-Warshall algorithm.
    Args:
        graph (list of list): Adjacency matrix of the graph where graph[i][j] is the weight of the edge (i, j).
    Returns:
        list of list: Matrix representing shortest distances between every pair of vertices.
    """
    num_vertices = len(graph)
    dist = [[graph[i][j] if i != j else 0 for j in range(num_vertices)] for i in range(num_vertices)]

    # Update distances using Floyd-Warshall logic
    for k in range(num_vertices):
        for i in range(num_vertices):
            for j in range(num_vertices):
                if dist[i][k] + dist[k][j] < dist[i][j]:
                    dist[i][j] = dist[i][k] + dist[k][j]

    return dist

# Example usage:
if __name__ == "__main__":
    # Graph represented as an adjacency matrix
    INF = sys.maxsize
    graph = [
        [0, 3, INF, INF],
        [INF, 0, 1, INF],
        [INF, INF, 0, 7],
        [2, INF, INF, 0]
    ]

    shortest_paths = floyd_warshall(graph)
    print("Shortest distances between every pair of vertices:")
    for row in shortest_paths:
        print(row)
