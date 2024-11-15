INF = Float::INFINITY

def floyd_warshall(graph)
  v = graph.size
  dist = Array.new(v) { |i| graph[i].dup }

  v.times do |k|
    v.times do |i|
      v.times do |j|
        if dist[i][k] != INF && dist[k][j] != INF
          dist[i][j] = [dist[i][j], dist[i][k] + dist[k][j]].min
        end
      end
    end
  end
  print_solution(dist)
end

def print_solution(dist)
  puts "Shortest distances between every pair of vertices:"
  dist.each do |row|
    row.each { |val| print val == INF ? "INF " : "#{val} " }
    puts
  end
end

graph = [
  [0, 3, INF, INF],
  [INF, 0, 1, INF],
  [INF, INF, 0, 7],
  [2, INF, INF, 0]
]

floyd_warshall(graph)
