# Exercício de programação 4

Considerando uma sequência de pontos e uma sequência de circunferências no plano cartesiano, pretende-se implementar a sub-rotina `closestCircle` que, para cada ponto , identifica a circunferência mais próxima.

O vetor VP contém as coordenadas cartesianas $\left(x, y\right)$ de NP pontos representadas em vírgula flutuante com precisão simples. O tamanho de VP é 2×NP. O vetor VC contém as coordenadas do centro e o raio $\left(x_c, y_c, r\right)$ de NC circunferências representados em vírgula flutuante com precisão dupla. O tamanho de VC é 3×NC. O vetor ID é preenchido por closestCircle com o índice (0 a NC-1) da circunferência mais próxima de cada ponto. O tamanho de ID é NP. Assumir que NP>0 e NC>0.

Considerar a distância entre um ponto e o ponto da circunferência mais próximo, dada por $d=\sqrt{\left(x-x_c\right)^2 + \left(y-y_c\right)^2}-r$. Se $d>0$ então o ponto não pertence ao círculo, pelo que a distância é "válida". Se o ponto pertencer ao círculo, a respetiva circunferência não é considerada para solução. No caso de um ponto pertencer a todos os círculos, a posição de ID referente a esse ponto deve manter o valor -1 pré-preenchido na inicialização em main(). No caso de haver várias circunferências à mesma distância de um ponto e se essa distância for a mínima, considerar o índice da última circunferência encontrada nessa situação.

A sub-rotina closestCircle tem os seguintes argumentos pela ordem indicada:

* valor de NP (do tipo unsigned int)
* endereço-base de VP
* valor de NC (do tipo unsigned int)
* endereço-base de VC
* endereço-base de ID

Para efeitos de teste, pode ser utilizado o seguinte código:

```c
#include <stdio.h>
#include <stdlib.h>

extern void closestCircle(unsigned int np, float *vp, unsigned int nc, double *vc, int *id);

int main(void)
{
  unsigned int NP = 2;  // Nº pontos
  unsigned int NC = 4;  // Nº circunferências
  int ID[] = {-1, -1};
  //Exemplo 1: VP1 e VC1
  float VP1[] = {-1.0, 0.0, 2.7, 1.15};
  double VC1[]= {-4.0, -1.0, 1.0, -3.89, 5.4, 0.51, 2.0, 1.0, 1.0, 3.0, 1.21, 0.9};
  //Exemplo 2: VP2 e VC2
  float VP2[] = {-3.0, 1.0, -3.0, -1.5};
  double VC2[]= {0.0, -6.0, 6.0, -10.0, 0.0, 10.75, 0.0, 0.0, 5.0};
  int i;

  closestCircle(NP, VP1, NC, VC1, ID);
  printf("Exemplo 1: ID = ");
  for (i=0; i<NP; i++)
     {printf("%d ", ID[i]); ID[i]=-1;}
  printf("\n");
  closestCircle(NP, VP2, 3, VC2, ID);
  printf("Exemplo 2: ID = ");
  for (i=0; i<NP; i++)
     printf("%d ", ID[i]);
  printf("\n");
  return EXIT_SUCCESS;
}
```

**Exemplos:**

1. Se VP[] = {-1.0, 0.0, 2.7, 1.15} e VC[]= {-4.0, -1.0, 1.0, -3.89, 5.4, 0.51, 2.0, 1.0, 1.0, 3.0, 1.21, 0.9} resulta ID[] = {2, 0}.
2. Se VP[] = {-3.0, 1.0, -3.0, -1.5} e VC[]= {0.0, -6.0, 6.0, -10.0, 0.0, 10.75, 0.0, 0.0, 5.0} resulta ID[] = {0, -1}.
