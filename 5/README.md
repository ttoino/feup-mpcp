# Exercício de programação 5

Pretende-se obter o histograma das classificações de uma unidade curricular, isto é, o número de ocorrências de cada classificação, assim como a classificação média. A sub-rotina a desenvolver, `histo`, deverá utilizar instruções SIMD sempre que as operações necessárias possam envolver o processamento de vários dados em paralelo.

O vetor C contém as classificações de uma unidade curricular representadas por inteiros de 0 a 20. O tamanho de C é N (>0) e é múltiplo de 16. A sub-rotina histo preenche o vetor H com a frequência de cada uma das classificações e retorna a média das classificações (valor do tipo float).

A sub-rotina recebe, por ordem, os seguintes argumentos:

* valor de N (do tipo unsigned int)
* endereço-base de C
* endereço-base de H

Assumir que a frequência de cada classificação não excede 255.

Para efeitos de teste, pode ser utilizado o seguinte código:

```c
#include <stdio.h>
#include <stdlib.h>

extern float histo(unsigned int N, unsigned char *C, unsigned char *H);

int main(void)
{
  unsigned char H[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  float res;
  int i;
  unsigned char C1[] = {15, 18, 5, 20, 9, 10, 1, 12, 16, 7, 14, 8, 10, 14, 14, 16};
  unsigned char C2[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 10, 11, 12, 13, 14, 15, 16, 17, 18, 0, 0};

    //Exemplo 1
  res = histo(16, C1, H);
  printf("Exemplo 1:\n");
  for (i=0; i<21; i++)
    {printf("%d ---> %d\n", i, H[i]); H[i]=0;}
  printf("Média = %f\n\n", res);
    //Exemplo 2
  res = histo(32, C2, H);
  printf("Exemplo 2:\n");
  for (i=0; i<21; i++)
    printf("%d ---> %d\n", i, H[i]);
  printf("Média = %f\n\n", res);
  return EXIT_SUCCESS;
}
```

**Exemplos:**

1. Se C[] = {15, 18, 5, 20, 9, 10, 1, 12, 16, 7, 14, 8, 10, 14, 14, 16} resulta H[] = {0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 2, 0, 1, 0, 3, 1, 2, 0, 1, 0, 1} e média = 11.8125.

2. Se C[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 10, 11, 12, 13, 14, 15, 16, 17, 18, 0, 0} resulta H[] = {3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1} e média = 10.5.
