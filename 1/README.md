# Exercício de programação 1

Escrever uma sub-rotina que substitui por 0 (zero) os elementos de uma sequência cujo valor absoluto é maior que o valor positivo X, devolvendo o número de elementos modificados. Os elementos da sequência são do tipo *signed word*.

A sub-rotina deve ter o nome CheckABS e aceitar os seguintes argumentos pela ordem indicada:

1. valor X (do tipo unsigned word);
2. número de elementos da sequência (do tipo unsigned word);
3. endereço-base da sequência.

Para efeitos de teste, podem utilizar o seguinte código C:

```c
#include <stdio.h>
#include <stdlib.h>

extern int CheckABS( int numx, int tam, int *seq);

int main(void) {
    int x = 20; 
    int tamanho = 8;
    int ve[] = {7, -8, -23, 56, 20, -10, 0, 40};
    int res;         

    res = CheckABS(x, tamanho, ve);
    printf("Foram modificados %d elementos da sequencia ve[]", res);

    // para o exemplo fornecido o output deve indicar que foram alterados 3 elementos

    // no final da execução a sequência ve[] = {7, -8, 0, 0, 20, -10, 0, 0} (podem verificar

    //o seu conteúdo durante a execução em modo debug)

    return EXIT_SUCCESS;
}
```
