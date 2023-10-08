  .data
vetor: .word 10 9 8 7 6 5 4 3 2 1
  ##### START MODIFIQUE AQUI START #####
  #
  # Este espaço é para você definir as suas constantes e vetores auxiliares.
  #
  ##### END MODIFIQUE AQUI END #####
  .text
  jal x1, contador
  addi x14, x0, 5 # utilizado para correção
  beq x14, x10, FIM # Verifica # de pares
  beq x14, x11, FIM # Verifica # de ímpares

  ##### START MODIFIQUE AQUI START #####
contador: 
  # t2: endereço inicial do vetor
  # t3: tamanho do vetor
  LA x6, vetor
  LI x7, 10

  # x10: quantidade de pares
  # x11: quantidade de ímpares
  ADDI x10, zero, 0
  ADDI x11, zero, 0
  ADDI x12, zero, 0 # i utilizado no for
for:
  BGE x12, x7, end_for
  ADDI x12, x12, 1 # incrementa o i
  LW x29, 0(x6) # pega o elemento na posição i
  ANDI x28, x29, 1
if:
  BEQZ x28, else # se for par, pule para o else
  ADDI, x11, x11, 1
  J end_if
else:
  ADDI, x10, x10, 1
end_if:
  ADDI x6, x6, 4 # incrementa a posição no vetor
  J for
end_for:
  jalr x0, 0(x1)
  ##### END MODIFIQUE AQUI END #####
FIM: addi x0, x0, 1
