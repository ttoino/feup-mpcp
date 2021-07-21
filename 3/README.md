# Exercício de programação 3

Pretende-se implementar a sub-rotina OpMat capaz de realizar uma sequência de operações sobre uma matriz com NCOL colunas e NLIN linhas.

As dimensões e os elementos da matriz são valores de 8 bits sem sinal. A matriz é representada por um vetor com NCOL\*NLIN elementos formado pela sequência de linhas da matriz. Desta forma, o elemento da coluna col e linha lin ocupa a posição lin\*NCOL+col do vetor.

A sequência de operações a realizar é formada por carateres que definem operações, algumas das quais possuem argumentos (valores de 8 bits sem sinal). As operações são:

* **'L', lin, n** - atribui o valor n a todos os elementos da linha lin (0 <= lin < NLIN),
* **'C', col, n** - atribui o valor n a todos os elementos da coluna col (0 <= col < NCOL),
* **'P', col, lin, n** - atribui o valor n ao elemento da coluna col e linha lin,
* **'B'** - "binariza" a matriz, isto é, valores no intervalo [0; 127] são substituídos por 0 e os restantes são substituídos por 255,
* **'O', n** - conta o número de ocorrências do valor n na matriz,
* **'X'** - indica fim das operações a realizar pela sub-rotina, estando sempre presente numa sequência de operações. Pode ocorrer em qualquer posição da sequência (ver exemplo a) em baixo).

A sequência de operações pode conter várias operações do mesmo tipo.

A sub-rotina `OpMat` recebe, por ordem, os seguintes argumentos:

* NCOL, número de colunas da matriz (0 <= NCOL < 256),
* NLIN, número de linhas da matriz (0 <= NLIN < 256),
* OPS, endereço base do vetor de operações a realizar,
* MAT, endereço base do vetor formado pelos elementos da matriz.

A sub-rotina deve devolver o resultado da última operação 'O' realizada, ou -1 se 'O' não fizer parte da sequência de operações.

A operação 'O' deve ser realizada pela sub-rotina `ocorr`, a invocar em OpMat, a qual recebe os seguintes argumentos:

* valor a pesquisar em w0,
* endereço do vetor a pesquisar em x1,
* tamanho do vetor a pesquisar rm w2.

O resultado de ocorr deve ser devolvido em w0.

**Nota importante:** deverá ser considerada a preservação/recuperação de registos, usando a pilha, na(s) subrotina(s) em que considere necessário e de acordo com as regras.

Para efeitos de teste, pode ser utilizado o seguinte código:

```c
#include <stdio.h>
#include <stdlib.h>

extern int OpMat(char nc, char nl, unsigned char *o, unsigned char *v);

int main(void)
{
  unsigned char ncol = 4;  // Nº colunas da matriz
  unsigned char nlin = 3;  // Nº linhas da matriz
  unsigned char mat[] = {  29,  127,   11,  255,
                           100,   5,  200,    0,
                             1,  29,    0,  128 };
  unsigned char ops[] = {'L', 1, 33, 'C', 2, 99, 'X', 'B', 'C', 0, 111};   // Exemplo a)
  unsigned char ops2[]= {'L', 1, 33, 'C', 2, 99, 'O', 33, 'B', 'C', 0, 123, 'O', 255, 'P', 2, 0, 26, 'X'};   // Exemplo b)
  int  res;
  char i, j;

  res = OpMat(ncol, nlin, ops, mat);
  printf("Retorno de OpMat = %d\n", res);
  for (i=0; i<nlin; i++)
  {
      for (j=0; j<ncol; j++)
          printf("%*d", 4, mat[i*ncol+j]);
      printf("\n");
  }
  printf("\n");
  return EXIT_SUCCESS;
}
```

**Exemplos:** Se mat[] = {29, 127, 11, 255, 100, 5, 200, 0, 1, 29, 0, 128} e

1. ops[] = {'L', 1, 33, 'C', 2, 99, 'X', 'B', 'C', 0, 111}, resulta res=-1 e mat[] = {29, 127, 99, 255, 33, 33, 99, 33, 1, 29, 99, 128}
2. ops[] = {'L', 1, 33, 'C', 2, 99, 'O', 33, 'B', 'C', 0, 123, 'O', 255, 'P', 2, 0, 26, 'X'}, resulta res=2 e mat[] = {123, 0, 26, 255, 123, 0, 0, 0, 123, 0, 0, 255}
