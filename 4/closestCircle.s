.text
.global closestCircle
.type closestCircle, "function"

// w0 -> np (uint)
// x1 -> *vp (float)
// w2 -> nc (uint)
// x3 -> *vc (double)
// x4 -> *ic (int)
closestCircle:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    mov w9, 0

loop_p:
    cmp w9, w0
    beq end

    ldr s0, [x1], 4 // p_x
    fcvt d0, s0
    ldr s1, [x1], 4 // p_y
    fcvt d1, s1

    mov w10, 0
    mov x11, x3

    ucvtf s7, xzr

loop_c:
    cmp w10, w2
    beq end_p

    ldr d2, [x11], 8 // c_x
    ldr d3, [x11], 8 // c_y
    ldr d4, [x11], 8 // c_r

    fsub d5, d0, d2 // x - x0
    fmul d5, d5, d5 // (x - x0)²
    fsub d6, d1, d3 // y - y0
    fmadd d5, d6, d6, d5 // (x - x0)² + (y - y0)²
    fsqrt d5, d5 // sqrt((x - x0)² + (y - y0)²)
    fsub d5, d5, d4 // sqrt((x - x0)² + (y - y0)²) - r

    fcmp d5, 0
    ble end_c
    fcmp d7, 0
    fccmp d5, d7, 0b1000, ne
    bgt end_c
    fmov d7, d5
    lsl w12, w9, 2
    str w10, [x4, x12]

end_c:
    add w10, w10, 1
    b loop_c

end_p:
    add w9, w9, 1
    b loop_p

end:
    ldp x29, x30, [sp], 16
    ret
