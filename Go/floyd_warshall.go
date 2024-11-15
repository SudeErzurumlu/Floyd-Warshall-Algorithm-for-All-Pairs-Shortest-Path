package main

import (
	"fmt"
	"math"
)

const INF = math.MaxInt32

func floydWarshall(graph [][]int) {
	V := len(graph)
	dist := make([][]int, V)
	for i := range graph {
		dist[i] = append([]int(nil), graph[i]...)
	}

	for k := 0; k < V; k++ {
		for i := 0; i < V; i++ {
			for j := 0; j < V; j++ {
				if dist[i][k] != INF && dist[k][j] != INF && dist[i][k]+dist[k][j] < dist[i][j] {
					dist[i][j] = dist[i][k] + dist[k][j]
				}
			}
		}
	}

	printSolution(dist)
}

func printSolution(dist [][]int) {
	fmt.Println("Shortest distances between every pair of vertices:")
	for _, row := range dist {
		for _, val := range row {
			if val == INF {
				fmt.Print("INF ")
			} else {
				fmt.Printf("%d ", val)
			}
		}
		fmt.Println()
	}
}

func main() {
	graph := [][]int{
		{0, 3, INF, INF},
		{INF, 0, 1, INF},
		{INF, INF, 0, 7},
		{2, INF, INF, 0},
	}
	floydWarshall(graph)
}
