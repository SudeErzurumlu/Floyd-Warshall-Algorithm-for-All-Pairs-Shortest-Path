using System;

class FloydWarshall
{
    static readonly int INF = 99999;

    static void FloydWarshallAlgo(int[,] graph)
    {
        int V = graph.GetLength(0);
        int[,] dist = (int[,])graph.Clone();

        for (int k = 0; k < V; k++)
        {
            for (int i = 0; i < V; i++)
            {
                for (int j = 0; j < V; j++)
                {
                    if (dist[i, k] != INF && dist[k, j] != INF)
                        dist[i, j] = Math.Min(dist[i, j], dist[i, k] + dist[k, j]);
                }
            }
        }
        PrintSolution(dist);
    }

    static void PrintSolution(int[,] dist)
    {
        int V = dist.GetLength(0);
        Console.WriteLine("Shortest distances between every pair of vertices:");
        for (int i = 0; i < V; i++)
        {
            for (int j = 0; j < V; j++)
            {
                if (dist[i, j] == INF)
                    Console.Write("INF ");
                else
                    Console.Write(dist[i, j] + " ");
            }
            Console.WriteLine();
        }
    }

    static void Main()
    {
        int[,] graph = {
            {0, 3, INF, INF},
            {INF, 0, 1, INF},
            {INF, INF, 0, 7},
            {2, INF, INF, 0}
        };

        FloydWarshallAlgo(graph);
    }
}
