.text
.global CheckABS
.type CheckABS, "function"

CheckABS: lsl x1, x1, 2
          mov x5, 0
          b end
loop:     sub x1, x1, 4
          ldr w3, [x2, x1]
          cmp w3, 0
          cneg w4, w3, lt
          cmp w4, w0
          csel w3, wzr, w3, gt
          cinc x5, x5, gt
          str w3, [x2, x1]
end:      cbnz x1, loop
          mov x0, x5
          ret
