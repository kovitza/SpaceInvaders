-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
-- CREATED		"Thu Dec 22 21:56:23 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Kokica IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		valid_metak :  IN  STD_LOGIC;
		X :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		X_POS :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		Y :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		Y_POS :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		valid :  OUT  STD_LOGIC;
		COLLISION :  OUT  STD_LOGIC;
		B :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		G :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		R :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END kokica;

ARCHITECTURE bdf_type OF Kokica IS 

COMPONENT cmpx
GENERIC (size : INTEGER
			);
	PORT(A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 ls : OUT STD_LOGIC;
		 eq : OUT STD_LOGIC;
		 gr : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT constx
GENERIC (const : INTEGER;
			size : INTEGER
			);
	PORT(		 data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alux
GENERIC (size : INTEGER
			);
	PORT(Cin : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Cout : OUT STD_LOGIC;
		 F : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT regx
GENERIC (default_value : INTEGER;
			size : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 cl : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 dec : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	0 :  STD_LOGIC;
SIGNAL	1 :  STD_LOGIC;
SIGNAL	KILL :  STD_LOGIC;
SIGNAL	valid_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	X_IN_RANGE :  STD_LOGIC;
SIGNAL	Y_IN_RANGE :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;


BEGIN 



b2v_inst : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => X,
		 B => SYNTHESIZED_WIRE_0,
		 gr => SYNTHESIZED_WIRE_3);


b2v_inst1 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => X,
		 B => SYNTHESIZED_WIRE_1,
		 ls => SYNTHESIZED_WIRE_2);


X_IN_RANGE <= SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3;


b2v_inst12 : constx
GENERIC MAP(const => 0,
			size => 4
			)
PORT MAP(		 data => G);


b2v_inst13 : alux
GENERIC MAP(size => 10
			)
PORT MAP(A => X_POS,
		 B => SYNTHESIZED_WIRE_4,
		 op => SYNTHESIZED_WIRE_5,
		 F => SYNTHESIZED_WIRE_10);


b2v_inst14 : constx
GENERIC MAP(const => 0,
			size => 4
			)
PORT MAP(		 data => B);


b2v_inst16 : constx
GENERIC MAP(const => 60,
			size => 10
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_4);



b2v_inst18 : constx
GENERIC MAP(const => 4,
			size => 3
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_5);


b2v_inst19 : alux
GENERIC MAP(size => 10
			)
PORT MAP(A => Y_POS,
		 B => SYNTHESIZED_WIRE_6,
		 op => SYNTHESIZED_WIRE_7,
		 F => SYNTHESIZED_WIRE_11);


b2v_inst2 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => Y,
		 B => SYNTHESIZED_WIRE_8,
		 ls => SYNTHESIZED_WIRE_13);


b2v_inst20 : constx
GENERIC MAP(const => 60,
			size => 10
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_6);


b2v_inst21 : constx
GENERIC MAP(const => 4,
			size => 3
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_7);


SYNTHESIZED_WIRE_9 <= valid_metak AND valid_ALTERA_SYNTHESIZED;


valid_ALTERA_SYNTHESIZED <= X_IN_RANGE AND 1 AND Y_IN_RANGE;


PROCESS(CLK)
VARIABLE synthesized_var_for_KILL : STD_LOGIC;
BEGIN
IF (RISING_EDGE(CLK)) THEN
	synthesized_var_for_KILL := (NOT(synthesized_var_for_KILL) AND SYNTHESIZED_WIRE_9) OR (synthesized_var_for_KILL AND (NOT(1)));
END IF;
	KILL <= synthesized_var_for_KILL;
END PROCESS;


b2v_inst3 : regx
GENERIC MAP(default_value => 380,
			size => 10
			)
PORT MAP(clk => CLK,
		 ld => 1,
		 data_in => X_POS,
		 data_out => SYNTHESIZED_WIRE_0);


b2v_inst4 : regx
GENERIC MAP(default_value => 420,
			size => 10
			)
PORT MAP(clk => CLK,
		 ld => 1,
		 data_in => SYNTHESIZED_WIRE_10,
		 data_out => SYNTHESIZED_WIRE_1);



b2v_inst6 : regx
GENERIC MAP(default_value => 550,
			size => 10
			)
PORT MAP(clk => CLK,
		 ld => 1,
		 data_in => Y_POS,
		 data_out => SYNTHESIZED_WIRE_12);


b2v_inst7 : regx
GENERIC MAP(default_value => 590,
			size => 10
			)
PORT MAP(clk => CLK,
		 ld => 1,
		 data_in => SYNTHESIZED_WIRE_11,
		 data_out => SYNTHESIZED_WIRE_8);


b2v_inst8 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => Y,
		 B => SYNTHESIZED_WIRE_12,
		 gr => SYNTHESIZED_WIRE_14);


Y_IN_RANGE <= SYNTHESIZED_WIRE_13 AND SYNTHESIZED_WIRE_14;


b2v_nijebitnokakosezove : constx
GENERIC MAP(const => 15,
			size => 4
			)
PORT MAP(		 data => R);

valid <= valid_ALTERA_SYNTHESIZED;
COLLISION <= KILL;

0 <= '0';
1 <= '1';
END bdf_type;