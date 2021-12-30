SUBDIR = src,src/1_syntactic_analysis,src/2_semantic_analysis,src/3_IR_production,src/4_middle-end,src/5_back-end

all :
	ocamlbuild -r -Is $(SUBDIR) -use-menhir test.byte 

explain : 
	menhir --explain src/1_syntactic_analysis/parser.mly
	rm src/1_syntactic_analysis/parser.ml
	rm src/1_syntactic_analysis/parser.mli
	mv src/1_syntactic_analysis/parser.conflicts .

launch : 
	./test.byte tests/main.test 
	spim -file test.asm

launch2 : 
	./test.byte tests/5.test 


test0 : 
	./test.byte tests/0.test 
	spim -file test.asm
test1 : 
	./test.byte tests/1.test 
	spim -file test.asm
test2 : 
	./test.byte tests/2.test 
	spim -file test.asm
test3 : 
	./test.byte tests/3.test 
	spim -file test.asm
test4 : 
	./test.byte tests/4.test 
	spim -file test.asm
test5 : 
	./test.byte tests/5.test 
	spim -file test.asm
test6 : 
	./test.byte tests/6.test 
	spim -file test.asm
test7 : 
	./test.byte tests/main.test 
	spim -file test.asm





error0 : 
	./test.byte errors/0.test 
	spim -file test.asm
error1 : 
	./test.byte errors/1.test 
	spim -file test.asm
error2 : 
	./test.byte errors/2.test 
	spim -file test.asm
error3 : 
	./test.byte errors/3.test 
	spim -file test.asm
error4 : 
	./test.byte errors/4.test 
	spim -file test.asm
error5 : 
	./test.byte errors/5.test 
	spim -file test.asm
error6 : 
	./test.byte errors/6.test 
	spim -file test.asm
error7 : 
	./test.byte errors/main.test 
	spim -file test.asm




asm:
	spim -file test.asm