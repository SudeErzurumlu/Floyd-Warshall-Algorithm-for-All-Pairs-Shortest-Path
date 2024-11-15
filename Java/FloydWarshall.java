import java.util.Arrays;

public class FloydWarshall {
    final static int INF = 99999;

    // Function to implement Floyd-Warshall Algorithm
    public void floydWarshall(int graph[][]) {
        int V = graph.length;
        int dist[][] = new int[V][V];

        // Initialize distance matrix
        for (int i = 0; i < V; i++)
            dist[i] = Arrays.copyOf(graph[i], V);

        // Algorithm
        for (int k = 0; k < V; k++) {
            for (int i = 0; i < V; i++) {
                for (int j = 0; j < V; j++) {
                    if (dist[i][k] != INF && dist[k][j] != INF)
                        dist[i][j] = Math.min(dist[i][j], dist[i][k] + dist[k][j]);
                }
            }
        }

        // Print the result
        printSolution(dist);
    }

    // Helper function to print the matrix
    private void printSolution(int dist[][]) {
        System.out.println("Shortest distances between every pair of vertices:");
        for (int i = 0; i < dist.length; i++) {
            for (int j = 0; j < dist.length; j++) {
                if (dist[i][j] == INF)
                    System.out.print("INF ");
                else
                    System.out.print(dist[i][j] + " ");
            }
            System.out.println();
        }
    }

    // Main method
    public static void main(String[] args) {
        FloydWarshall fw = new FloydWarshall();
        int graph[][] = {
            {0, 3, INF, INF},
            {INF, 0, 1, INF},
            {INF, INF, 0, 7},
            {2, INF, INF, 0}
        };
        fw.floydWarshall(graph);
    }
}
