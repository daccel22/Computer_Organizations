#hw1.2
		.data
success: .asciiz "\nSuccess!Location:"
failure: .asciiz "\nFail!\n"
ret: .asciiz "\n" 			#return
strg: .space 120
	.text
	.globl main
main:
	la $a0,strg
	li $a1,120
	li $v0,8
	syscall				#input string
input_c:	
	li $v0,12
	syscall
	li $t0,63
	beq $v0,$t0, Exit 		#whether ?
	li $t0,0
	la $s1,strg
loop_f:					#input letter
	lb $s0,0($s1)
	beq $v0,$s0,succeed
	addi $t0,$t0,1
	slt $t3,$t0,$a1
	beqz $t3,failed
	addi $s1,$s1,1
	j loop_f
succeed:				#sucessful
	la $a0,success
	li $v0,4
	syscall
	addi $a0,$t0,1
	li $v0,1
	syscall
	la $a0,ret
	li $v0,4
	syscall
	j input_c
failed:					#failed
	la $a0,failure
	li $v0,4
	syscall
	j input_c
	
Exit: li $v0,10
	syscall
