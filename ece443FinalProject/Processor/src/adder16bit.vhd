--BRADLEY MCKEE WORKSPACE #3

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL; 
use ieee.numeric_std.all;


entity adder16bit is port(
	A,B: in std_logic_vector(15 downto 0);
	C : in std_logic;
	RESULT : out std_logic_vector(15 downto 0);
	Cout : out std_logic
);
end entity;

architecture structure of adder16bit is 

	
component fulladder is port(
	A,B,Cin : in std_logic;
	Sum,Cout : out std_logic
);
end component;


 

signal i : std_logic_vector(15 downto 0) := (Others => '0'); 
--iterate through

begin
looplabel: for bit in 0 to 15 generate	
	
	start: if bit = 0 generate
   start2: fulladder port map(A(bit),B(bit),C,RESULT(bit),Cout);
	end generate; 
	
	addMiddle: if (bit > 0) generate
	addMiddle2: if(bit < 15) generate
	middlebits: fulladder port map (A(bit),B(bit),i(bit),RESULT(bit),i(bit+1));
	end generate;
	end generate;
	
  	ending: if bit = 15 generate
  	finalbit:	fulladder port map(A(bit),B(bit),i(bit),RESULT(bit),Cout);
  	end generate;
	  
end generate;	

end structure;
