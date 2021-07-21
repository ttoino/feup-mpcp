.text
.global histo
.type histo, "function"

// w0 -> n (unsigned int)
// x1 -> *c (unsigned char)
// x2 -> *h (unsigned char)
histo:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    ucvtf s3, w0 // store length in fp register

    fmov s2, wzr // set acc to 0

loop:
    cbz w0, end
    sub w0, w0, 16

    ldr q0, [x1], 16
    uaddlv h1, v0.16b // add up all elements

    umov w3, v1.h[0] // convert to fp
    ucvtf s1, w3

    fadd s2, s2, s1 // accumulate

    mov w4, 21 // loop from 0 to 20

loop_grades:
    sub w4, w4, 1

    dup v1.16b, w4 // fill vector with grade

    cmeq v1.16b, v0.16b, v1.16b // test grades
    neg v1.16b, v1.16b
    addv b1, v1.16b // add it up
    umov w5, v1.b[0]

    ldrb w6, [x2, x4]
    add w5, w5, w6 // update with new data
    strb w5, [x2, x4]

    cbnz w4, loop_grades

    b loop

end:
    fdiv s0, s2, s3 // get mean

    ldp x29, x30, [sp], 16
    ret
