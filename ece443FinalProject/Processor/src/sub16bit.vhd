--BRADLEY MCKEE WORKSPACE #4

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sub16bit is port(
	A,B : in std_logic_vector(15 downto 0);
	C   : in std_logic;
	RESULT : out std_logic_vector(15 downto 0);
	Cout : out std_logic
);
end entity;

architecture structural of sub16bit is

component adder16bit is port(
	A,B : in std_logic_vector(15 downto 0);
	C   : in std_logic;
	RESULT   : out std_logic_vector(15 downto 0);
	Cout : out std_logic
);
end component;


component notGate is port(
	A: in std_logic;
	O: out std_logic
	);
end component;


signal i: std_logic_vector (15 downto 0);
signal Cadd : std_logic := '1';	-- input 1 to add the components

begin
	--INVERSE 1 SET OF DATA THEN ADD IT TO OTHER USING 16BIT ADDER (A-B) = (A + NOT B)
	looplabel: for bit in 0 to 15 generate	
	inverseData:  notGate port map(B(bit),i(bit));

  	end generate;
	addnegativetoA: adder16bit port map(A,i,Cadd,RESULT,Cout);
--end generate;

end structural;