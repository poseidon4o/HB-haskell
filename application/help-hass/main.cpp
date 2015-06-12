#include <iostream>
#include <string>
#include <queue>

using namespace std;

const int graph_max_size = 256;

// this will fail if there is a cycle or path does not exits
void outputPath(char parentList[graph_max_size], int from, int to) {
    if (from == to) {
        cout << (char)to << ' ';
        return;
    }
    outputPath(parentList, from, parentList[to]);
    cout << (char)to << ' ';
}

void bfs(bool graph[graph_max_size][graph_max_size], int from, int to) {
    queue<int> bfsFront;
    bfsFront.push(from);

    bool visited[graph_max_size] = { 0, };

    // bfs will have no cycles so parent mapping is ok
    char parentList[graph_max_size] = { 0, };

    while (!bfsFront.empty()) {
        int next = bfsFront.front();
        bfsFront.pop();

        if (next == to) {
            return outputPath(parentList, from, to);
        }

        for (int c = 0; c < graph_max_size; ++c) {
            if (graph[next][c] && !visited[c]) {
                visited[c] = true;
                // mark the parent to the candidate
                parentList[c] = next;
                bfsFront.push(c);
            }
        }
    }
}

int main() {
    bool graph[graph_max_size][graph_max_size];
    memset(graph, 0, graph_max_size * graph_max_size);

    char from, to;
    while (cin >> from >> to) {
        graph[from][to] = true;
    }

    bfs(graph, 'H', 'L');

    return 0;
}