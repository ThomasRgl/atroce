SUBDIR = src,src/1_syntactic_analysis,src/2_semantic_analysis,src/3_IR_production,src/4_middle-end,src/5_back-end

all :
	ocamlbuild -r -Is $(SUBDIR) -use-menhir test.byte 



launch : 
	./test.byte tests/5.test > test.asm
	spim -file test.asm
