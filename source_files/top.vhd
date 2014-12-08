library ieee;
use ieee.std_logic_1164.all;
use work.NN_PKG.all;

entity TOP is
	port	(
			START, CLK							:in std_logic;
			IN1, IN2, IN3, IN4				:in integer range -5 to 5;
			OUT1, OUT2, OUT3, OUT4 			:out integer
			);
end TOP;

architecture STRUCTURE of TOP is
	signal CONTROL_IN, CONTROL_HIDDEN, CONTROL_OUT	:std_logic;
	
	component NEURAL_NET
		port	(
				INPUT1, INPUT2, INPUT3, INPUT4				:in integer range -5 to 5;
				CONTROL_IN, CONTROL_HIDDEN, CONTROL_OUT	:in std_logic;
				OUTPUT1, OUTPUT2, OUTPUT3, OUTPUT4			:out integer;
				START, CLK											:in std_logic		
				);
	end component;
	
	component GENERIC_NEURAL_NET 
		generic	(
					N_I,N_H,N_O : natural -- N: Number of inputs; M: Number of Neurons/outputs
					);
		
		port		(
					INPUT													:in INT_ARRAY(0 to N_I);
					CONTROL_IN, CONTROL_HIDDEN, CONTROL_OUT	:in std_logic;
					OUTPUT												:out INT_ARRAY(0 to N_O);
					START, CLK											:in std_logic;
					W_B_ARRAY_3D: in FIX_ARRAY_3D(0 to (2))
					);

	end component;
	
	begin
		CONTROL_IN<='1';
		CONTROL_HIDDEN<='1';
		CONTROL_OUT<='1';
		
		NET: NEURAL_NET port map	(
											IN1, IN2, IN3, IN4,
											CONTROL_IN, CONTROL_HIDDEN, CONTROL_OUT,
											OUT1, OUT2, OUT3, OUT4,
											START, CLK	
											);
end STRUCTURE;