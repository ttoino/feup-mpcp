# Exercício de programação 2

Escreva uma sub-rotina que aceita duas sequências: seq_A e seq_B. Os elementos de seq_B são todos distintos e apenas podem ser letras minúsculas, sem acentos ou outras alterações. A sub-rotina altera para a sua versão maiúscula, todos os carateres de seq_A que surgem na seq_B. Apenas carateres que sejam letras minúsculas, sem acentos ou outras alterações, deverão ser alterados. Para além de alterar a seq_A, a sub-rotina deve retornar o número de carateres de seq_A que são alterados (este valor é um inteiro sem sinal).

Notas:

* Sequências de carateres são terminadas pelo carater nulo, o qual é codificado com o número 0;
* Consulte uma tabela ASCII (ex: <http://www.asciitable.com/>).

A sub-rotina deve ter o nome SelectedUpperCase e aceitar os seguintes argumentos pela ordem indicada:

1. endereço-base de seq_B;
2. endereço-base de seq_A.

Para efeitos de teste podem utilizar o seguinte código:

```c
#include <stdio.h>
#include <stdlib.h>

extern unsigned int SelectedUpperCase(char *seq_B, char *seq_A);

int main(void)
{
    char seq_A[] = "Esta frase deverá ter alguns dos seus carateres alterados para maiúscula!";
    char seq_B[] = "afuily";      

    unsigned int res = SelectedUpperCase(seq_B, seq_A);
    printf("Foram modificados %d carateres de seq_A. A sequência A é agora:\n", res);
    printf("%s\n", seq_A);

    // para o exemplo fornecido o output deve indicar que foram alterados 19 carateres.

    // no final da execução a sequência seq_A deverá ser "EstA FrAse deverá ter ALgUns dos seUs cArAteres ALterAdos pArA mAIúscULA!"

    return EXIT_SUCCESS;
}
```
