#include <stdio.h>
#include <stdlib.h>

int main(){

int m1[4][4], m2[4][4], mResultado[4][4];
int i = 0, j = 0, cont = 0, aux = 0, x = 0;

for(i = 0; i<4; i++){               //Preenchendo as matrizes de 0 a 15
    for(j = 0; j<4; j++){
        m1[i][j] = cont;
        m2[i][j] = cont;
        cont++;
    }
}
for(i = 0; i<4; i++){
    for(j = 0; j<4; j++){
        mResultado[i][j]=0;
        for(x = 0; x < 4; x++){
            aux += m1[i][x] * m2[x][j];     // calculo da matriz resultante
        }
        mResultado[i][j] = aux;
        aux = 0;
    }
}

for(i = 0; i<4; i++){
    printf("\n");
    for(j = 0; j < 4; j++){
        printf("[%d]", mResultado[i][j]);
    }
}

return 0;
}
