function floyd_warshall()
    % Example adjacency matrix (graph representation)
    INF = Inf;
    graph = [0, 3, INF, INF;
             INF, 0, 1, INF;
             INF, INF, 0, 7;
             2, INF, INF, 0];

    % Get the number of vertices
    V = size(graph, 1);
    dist = graph;

    % Floyd-Warshall algorithm
    for k = 1:V
        for i = 1:V
            for j = 1:V
                if dist(i, k) < INF && dist(k, j) < INF
                    dist(i, j) = min(dist(i, j), dist(i, k) + dist(k, j));
                end
            end
        end
    end

    % Display the result
    disp('Shortest distances between every pair of vertices:');
    for i = 1:V
        for j = 1:V
            if dist(i, j) == INF
                fprintf('%7s', 'INF');
            else
                fprintf('%7.2f', dist(i, j));
            end
        end
        fprintf('\n');
    end
end
