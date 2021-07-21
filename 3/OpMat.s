.text
.global OpMat
.type OpMat, "function"

// w0 -> w19 -> nCols  (char)
// w1 -> w20 -> nLines (char)
// x2 -> x21 -> ops    (uchar[])
// x3 -> x22 -> matrix (uchar[])
OpMat:  stp x29, x30, [sp, -16]!
        stp x19, x20, [sp, -16]!
        stp x21, x22, [sp, -16]!
        mov x29, sp

        mov w19, w0
        mov w20, w1
        mov x21, x2
        mov x22, x3
        mov w0, -1

loop:   ldrb w1, [x21], 1
        cmp w1, 'X'
        beq end
        cmp w1, 'L'
        beq L
        cmp w1, 'C'
        beq C
        cmp w1, 'P'
        beq P
        cmp w1, 'B'
        beq B
        cmp w1, 'O'
        beq O


L:      ldrb w1, [x21], 1 // line
        ldrb w2, [x21], 1 // n
        mov w3, w19       // col

Lloop:  cbz w3, loop
        sub w3, w3, 1
        madd w4, w1, w19, w3
        strb w2, [x22, x4]
        b Lloop


C:      ldrb w1, [x21], 1 // col
        ldrb w2, [x21], 1 // n
        mov w3, w20       // line

Cloop:  cbz w3, loop
        sub w3, w3, 1
        madd w4, w3, w19, w1
        strb w2, [x22, x4]
        b Cloop


P:      ldrb w1, [x21], 1 // col
        ldrb w2, [x21], 1 // line
        ldrb w3, [x21], 1 // n
        madd w4, w2, w19, w1
        strb w3, [x22, x4]
        b loop


B:      mul w1, w19, w20

Bloop:  cbz w1, loop
        sub w1, w1, 1
        ldrb w2, [x22, x1]
        mov w3, -1
        cmp w2, 127
        cinc w2, w3, ls
        strb w2, [x22, x1]
        b Bloop


O:      ldrb w0, [x21], 1
        mov x1, x22
        mul w2, w19, w20
        bl ocorr
        b loop


end:    ldp x21, x22, [sp], 16
        ldp x19, x20, [sp], 16
        ldp x29, x30, [sp], 16
        ret
