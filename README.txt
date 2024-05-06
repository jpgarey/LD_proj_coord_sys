README:

File structure and File description, and notes for how to run.
Report:
	project paper.pdf
	
Singular scripts:
	**Run the scripts in this order, otherwise the second script won't work.**
	LD_projectiveCoordinates.sing  - This script has procedures and code for generating the points on
	                                 the curve, the roots, transforming points from projective to affine
												coordinate space, and other test cases.
	el_gamal.sing                  - This script has procedures and code for doing key generation,
	                                 encryption, and decryption.
	
HDL files:
	verilog/GFSQR.v                - Galois Field square operation
	verilog/GFMult.v               - Galois Field Multiplication operation. Wrapper for MontMult.v.
	verilog/GFADD.v                - Galois Field bitwise XOR operation
	verilog/MontMult.v             - Montgomery Multiplier
	verilog/MR_block.v             - bottom level multiplication block
	verilog/PointDouble.v          - LD point doubling
	verilog/pointAddition.v        - point addition as shown in LD paper
	verilog/point_gen.v            - point generation state machine
	verilog/Encryption.v           - encryption equations
	verilog/Decryption.v           - decryption equations
	verilog/LD_ECC_encription.v    - wrapper for both encryption and decryption
	
Testbench files:
	**To run testbenches, open the file and edit the file path near the top to a valid path for your PC.**
	verilog/tb_MontMult.v          - exhaustive simulation of Montgomery Multiplication.
	verilog/tb_GFMult.v            - spot check simulation for Montgomery Multiplier
	verilog/tb_PointDouble.v       - simulates PointDouble.v
	verilog/tb_pointAddition.v     - simulates pointAddition.v
	verilog/tb_point_gen.v         - simulates both PointDouble.v & pointAddition.v to generate all points
	verilog/tb_gen_point_2.v       - simulates point_gen.v file, which is state machine for point generation
	verilog/tb_Encryption.v        - simulates encryption
	verilog/tb_Decryption.v        - simulates decryption
	verilog/tb_LD_ECC_encription.v - simulates LD_ECC_encription.v (both encryption and decryption)
	
HDL testbench results:
	Screenshots                    - No files. They are in the report.
	verilog/testbench_output       - Text output for GF multiplication, point addition, point doubling,
	                                 and point generation.
	