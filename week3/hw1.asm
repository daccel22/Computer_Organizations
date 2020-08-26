 
#hw_1.1
	.data
letters_B: .asciiz "Alpha ","Bravo ","China ","Delta ","Echo ","Foxtrot ","Golf ","Hotel ","India ","Juliet ","Kilo ","Lima ","Marry ","November ","Oscar ","Paper ","Quebec ","Research ","Sierra ","Tango ","Uniform ","Victor ","Whisky ","X-ray ","Yankee ","Zulu "
l_Offset:  .word 
	0,7,14,21,28,34,43,49,56,63,71,77,83,90,100,107,114,122,132,140,147,156,164,172,179,187	
letters_S: .asciiz "alpha ","bravo ","china ","delta ","echo ","foxtrot ","golf ","hotel ","india ","juliet ","kilo ","lima ","marry ","november ","oscar ","paper ","quebec ","research ","sierra ","tango ","uniform ","victor ","whisky ","x-ray ","yankee ","zulu "
Numbers:   .asciiz "zero ", "First ", "Second ", "Third ", "Fourth ", "Fifth ", "Sixth ", "Seventh ","Eighth ","Ninth "
n_Offset: .word 0,6,13,21,28,36,43,50,59,67 
	.text
	.globl main
#others-0~9-others-A~Z-others-a~z-others
main: li $v0,12
	syscall
	li $t0,63
	beq $v0,$t0, Exit	#whether ?
	li $t0, 48
	slt $s0,$v0,$t0
	bnez $s0,others		#1o
	li $t0,58
	slt $s0,$v0,$t0
	bnez $s0,prtn	#0~9
	li $t0,65
	slt $s0,$v0,$t0
	bnez $s0,others		#2o
	li $t0,91
	slt $s0,$v0,$t0
	bnez $s0,prtb	#A~Z
	li $t0, 97
	slt $s0,$v0,$t0
	bnez $s0,others		#3o
	li $t0,123
	slt $s0,$v0,$t0
	bnez $s0,prts	#a~z
	j others		#4o
	

prtb: sub $t0,$t0,26
	sub $t1,$v0,$t0
	sll $t1,$t1,2
	la $s0,l_Offset
	add $s0,$s0,$t1
	lw $s1,0($s0)
	la $a0,letters_B
	add $a0,$a0,$s1
	li $v0,4
	syscall
	j main
prts:sub $t0,$t0,26
	sub $t1,$v0,$t0
	sll $t1,$t1,2
	la $s0,l_Offset
	add $s0,$s0,$t1
	lw $s1,0($s0)
	la $a0,letters_S
	add $a0,$a0,$s1
	li $v0,4
	syscall
	j main
prtn:sub $t0,$t0,10
	sub $t1,$v0,$t0
	sll $t1,$t1,2
	la $s0, n_Offset
	add $s0,$s0,$t1
	lw $s1,0($s0)
	la $a0,Numbers
	add $a0,$a0,$s1
	li $v0,4
	syscall
	j main

others: sub $a0,$a0,$a0
	addi $a0,$a0,42
	li $v0,11
	syscall
	j main
Exit:	li $v0,10
	syscall
	

#End
