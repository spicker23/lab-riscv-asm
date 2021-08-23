#include <stdio.h>

#define N 5
#define M 4

void process(int n, int m, int matrix [M][N], int min) {
    min = matrix[0][0];
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            if (matrix [i][j] <= min)
            min = matrix[i][j];
        }
    }
    printf("%d ", min);
}

int main(int argc, char** argv) {
    int matrix[M][N];
    int min;

    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, min);

    return 0;
}

