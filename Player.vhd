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
-- CREATED		"Thu Dec 22 21:56:00 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Player IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		UP :  IN  STD_LOGIC;
		DOWN :  IN  STD_LOGIC;
		LEFT :  IN  STD_LOGIC;
		RIGHT :  IN  STD_LOGIC;
		FIRE :  IN  STD_LOGIC;
		X :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		Y :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		valid_metak :  OUT  STD_LOGIC;
		valid_player :  OUT  STD_LOGIC;
		B :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		G :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		R :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END Player;

ARCHITECTURE bdf_type OF Player IS 

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

COMPONENT r_e_d
	PORT(IN : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 OUT : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT metak
	PORT(CLK : IN STD_LOGIC;
		 FIRE : IN STD_LOGIC;
		 X : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 X_POS : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 Y : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 Y_POS : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 valid : OUT STD_LOGIC;
		 B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 G : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 R : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
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

COMPONENT mp2x
GENERIC (size : INTEGER
			);
	PORT(S : IN STD_LOGIC;
		 X0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 X1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT clk_divider
GENERIC (period_InMHz : INTEGER;
			period_OutMiliSec : INTEGER
			);
	PORT(in_clk : IN STD_LOGIC;
		 out_clk : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	granica_desno :  STD_LOGIC;
SIGNAL	granica_dole :  STD_LOGIC;
SIGNAL	granica_gore :  STD_LOGIC;
SIGNAL	granica_levo :  STD_LOGIC;
SIGNAL	METAK_B :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	METAK_G :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	METAK_R :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	move_down :  STD_LOGIC;
SIGNAL	move_left :  STD_LOGIC;
SIGNAL	move_right :  STD_LOGIC;
SIGNAL	move_up :  STD_LOGIC;
SIGNAL	PLAYER_X :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	PLAYER_Y :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	valid_player_signal :  STD_LOGIC;
SIGNAL	X_IN_RANGE :  STD_LOGIC;
SIGNAL	Y_IN_RANGE :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;


BEGIN 



b2v_inst : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => X,
		 B => PLAYER_X,
		 gr => SYNTHESIZED_WIRE_2);


b2v_inst1 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => X,
		 B => SYNTHESIZED_WIRE_31,
		 ls => SYNTHESIZED_WIRE_1);


X_IN_RANGE <= SYNTHESIZED_WIRE_1 AND SYNTHESIZED_WIRE_2;


b2v_inst12 : constx
GENERIC MAP(const => 15,
			size => 4
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_27);


b2v_inst13 : r_e_d
PORT MAP(IN => SYNTHESIZED_WIRE_3,
		 CLK => CLK,
		 OUT => SYNTHESIZED_WIRE_32);


b2v_inst14 : constx
GENERIC MAP(const => 15,
			size => 4
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_28);


b2v_inst15 : metak
PORT MAP(CLK => CLK,
		 FIRE => FIRE,
		 X => X,
		 X_POS => SYNTHESIZED_WIRE_4,
		 Y => Y,
		 Y_POS => PLAYER_Y,
		 valid => valid_metak,
		 G => METAK_G,
		 R => METAK_R);


SYNTHESIZED_WIRE_10 <= LEFT AND SYNTHESIZED_WIRE_32;


SYNTHESIZED_WIRE_11 <= SYNTHESIZED_WIRE_32 AND UP;


SYNTHESIZED_WIRE_12 <= SYNTHESIZED_WIRE_32 AND DOWN;


SYNTHESIZED_WIRE_13 <= SYNTHESIZED_WIRE_32 AND RIGHT;


b2v_inst2 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => Y,
		 B => SYNTHESIZED_WIRE_33,
		 ls => SYNTHESIZED_WIRE_29);


move_left <= SYNTHESIZED_WIRE_10 AND granica_levo;


move_up <= SYNTHESIZED_WIRE_11 AND granica_gore;


move_down <= SYNTHESIZED_WIRE_12 AND granica_dole;


move_right <= SYNTHESIZED_WIRE_13 AND granica_desno;


b2v_inst24 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => PLAYER_X,
		 B => SYNTHESIZED_WIRE_14,
		 eq => SYNTHESIZED_WIRE_20);


b2v_inst25 : constx
GENERIC MAP(const => 0,
			size => 10
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_14);


b2v_inst26 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => SYNTHESIZED_WIRE_31,
		 B => SYNTHESIZED_WIRE_16,
		 eq => SYNTHESIZED_WIRE_21);


b2v_inst27 : constx
GENERIC MAP(const => 799,
			size => 10
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_16);


b2v_inst28 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => PLAYER_Y,
		 B => SYNTHESIZED_WIRE_17,
		 eq => SYNTHESIZED_WIRE_22);


b2v_inst29 : constx
GENERIC MAP(const => 0,
			size => 10
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_17);


b2v_inst3 : regx
GENERIC MAP(default_value => 380,
			size => 10
			)
PORT MAP(clk => CLK,
		 inc => move_right,
		 dec => move_left,
		 data_out => PLAYER_X);


b2v_inst30 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => SYNTHESIZED_WIRE_33,
		 B => SYNTHESIZED_WIRE_19,
		 eq => SYNTHESIZED_WIRE_23);


b2v_inst31 : constx
GENERIC MAP(const => 599,
			size => 10
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_19);


granica_levo <= NOT(SYNTHESIZED_WIRE_20);



granica_desno <= NOT(SYNTHESIZED_WIRE_21);



granica_gore <= NOT(SYNTHESIZED_WIRE_22);



granica_dole <= NOT(SYNTHESIZED_WIRE_23);



b2v_inst36 : alux
GENERIC MAP(size => 10
			)
PORT MAP(A => PLAYER_X,
		 B => SYNTHESIZED_WIRE_24,
		 op => SYNTHESIZED_WIRE_25,
		 F => SYNTHESIZED_WIRE_4);


b2v_inst37 : constx
GENERIC MAP(const => 15,
			size => 10
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_24);


b2v_inst38 : constx
GENERIC MAP(const => 4,
			size => 3
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_25);


b2v_inst39 : mp2x
GENERIC MAP(size => 4
			)
PORT MAP(S => valid_player_signal,
		 X0 => METAK_R,
		 X1 => SYNTHESIZED_WIRE_26,
		 Y => R);


b2v_inst4 : regx
GENERIC MAP(default_value => 420,
			size => 10
			)
PORT MAP(clk => CLK,
		 inc => move_right,
		 dec => move_left,
		 data_out => SYNTHESIZED_WIRE_31);


b2v_inst40 : mp2x
GENERIC MAP(size => 4
			)
PORT MAP(S => valid_player_signal,
		 X0 => METAK_G,
		 X1 => SYNTHESIZED_WIRE_27,
		 Y => G);


b2v_inst41 : mp2x
GENERIC MAP(size => 4
			)
PORT MAP(S => valid_player_signal,
		 X0 => METAK_R,
		 X1 => SYNTHESIZED_WIRE_28,
		 Y => B);


valid_player_signal <= X_IN_RANGE AND Y_IN_RANGE;


b2v_inst5 : clk_divider
GENERIC MAP(period_InMHz => 50,
			period_OutMiliSec => 5
			)
PORT MAP(in_clk => CLK,
		 out_clk => SYNTHESIZED_WIRE_3);


b2v_inst6 : regx
GENERIC MAP(default_value => 550,
			size => 10
			)
PORT MAP(clk => CLK,
		 inc => move_down,
		 dec => move_up,
		 data_out => PLAYER_Y);


b2v_inst7 : regx
GENERIC MAP(default_value => 590,
			size => 10
			)
PORT MAP(clk => CLK,
		 inc => move_down,
		 dec => move_up,
		 data_out => SYNTHESIZED_WIRE_33);


b2v_inst8 : cmpx
GENERIC MAP(size => 10
			)
PORT MAP(A => Y,
		 B => PLAYER_Y,
		 gr => SYNTHESIZED_WIRE_30);


Y_IN_RANGE <= SYNTHESIZED_WIRE_29 AND SYNTHESIZED_WIRE_30;


b2v_nijebitnokakosezove : constx
GENERIC MAP(const => 15,
			size => 4
			)
PORT MAP(		 data => SYNTHESIZED_WIRE_26);

valid_player <= valid_player_signal;

END bdf_type;