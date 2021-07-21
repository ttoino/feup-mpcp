.text
.global ocorr
.type ocorr, "function"

// w0 -> n   (uchar)
// x1 -> mat (uchar[])
// w2 -> len (uchar)
ocorr:  stp x29, x30, [sp, -16]!
        mov x29, sp
        mov w3, 0

loop:   cbz w2, end
        sub w2, w2, 1
        ldrb w4, [x1, x2]
        cmp w4, w0
        cinc w3, w3, eq
        b loop

end:    mov w0, w3
        ldp x29, x30, [sp], 16
        ret
