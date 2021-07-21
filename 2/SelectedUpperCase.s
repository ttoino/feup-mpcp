.text
.global SelectedUpperCase
.type SelectedUpperCase, "function"

// x0 -> seq_b (letras para fazer maiusculas)
// x1 -> seq_a (frase)
// x2 -> ret
// x3 -> x0 (para modificar)
// w4 -> letra_a
// w5 -> letra_b
SelectedUpperCase: mov x2, 0

loop_a:            mov x3, x0
                   ldrb w4, [x1], 1
                   cbz w4, end

loop_b:            ldrb w5, [x3], 1
                   cbz w5, loop_a
                   cmp w4, w5
                   bne loop_b
                   sub w4, w4, 32
                   strb w4, [x1, -1]
                   add x2, x2, 1
                   b loop_a

end:               mov x0, x2
                   ret
