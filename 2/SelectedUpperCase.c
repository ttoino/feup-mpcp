#include <stdio.h>
#include <stdlib.h>

extern unsigned int SelectedUpperCase(char *seq_B, char *seq_A);

int main()
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