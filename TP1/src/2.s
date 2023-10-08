    .data
    vetor: .word 200 190 340 160 230 100 90 1 0 # exemplo
    ##### START MODIFIQUE AQUI START #####
    #
    # Este espaço é para você definir as suas constantes e vetores auxiliares.
    .text
    LA a0, vetor # endereço do vetor
    LI a1, 9     # tamanho do vetor
    LI a2, 200   # limiar desejado
    ##### END MODIFIQUE AQUI END #####
    jal ra, main
    # Ao final do reajuste (aplica_reajuste) você deve retornar o programa para a
    # próxima instrução abaixo, que consiste na correção/verificação.

    ##### START INSTRUÇÃO DE CORREÇÃO/VERIFICAÇÃO #####
    # utilizado para correção (considerando um limiar de 200 para o vetor de
    # exemplo após a aplicação do reajuste.
    addi a4, x0, 5 # configurando a quantidade de salários acima do limiar de 200.
    beq a4, t0, FIM # Verifica a quantidade de salários acima do limiar.
    ##### END INSTRUÇÃO DE CORREÇÃO/VERIFICAÇÃO #####
main:
    ##### START MODIFIQUE AQUI START #####
    # empilha ra
    ADDI sp, sp, -4
    SW ra, 0(sp)

    JAL ra, aplica_reajuste

    # desempilha ra
    LW ra, 0(sp)
    ADDI sp, sp, 4
    RET
    ##### END MODIFIQUE AQUI END #####
    # dica, você deve salvar o endereço da primeira chamada (em stack (sp)) para
    # depois recuperá-lo.
aplica_reajuste:
    ##### START MODIFIQUE AQUI START #####
    LI t0, 0 # contador de salários acima do limiar
    ADDI t1, zero, 0 # i utilizado no for
    LI t2, 2 # Constante de devisão para obter 50%
for:
    BGT t1, a1, end_for
    ADDI t1, t1, 1 # incrementa o i
    LW t6, 0(a0) # pega o elemento na posição i
    DIVU t3, t6, t2 # Devide o valor por 2 para obter os 50%
    ADD t6, t6, t3 # incrementa +50% no salário
    SW t6, 0(a0) # salva o novo valor
if:
    BGE t6, a2, else # se o elemento na posição i for maior que o limiar, pule para else
    J end_if
else:
    ADDI t0, t0, 1 # incrementa o contador de salários acima do limiar
end_if:
    ADDI a0, a0, 4 # incrementa a posição no vetor
    J for
end_for:
    MV a0, t0 # salva o valor de retorno da função
    RET
    ##### END MODIFIQUE AQUI END #####
FIM: addi x0, x0, 1
