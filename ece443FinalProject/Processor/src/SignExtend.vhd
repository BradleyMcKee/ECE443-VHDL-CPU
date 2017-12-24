library ieee ;
use ieee.std_logic_1164.all;

---------------------------------------------

entity SignExtend is
port(	  
	input	:	in std_logic_vector(7 downto 0);
	output	:	out std_logic_vector(15 downto 0)
);
end SignExtend;

architecture Structural of SignExtend is
begin
	output(7 downto 0) <= input(7 downto 0);
	output(8) <= input(7);
	output(9) <= input(7);
	output(10) <= input(7);
	output(11) <= input(7);
	output(12) <= input(7);
	output(13) <= input(7);
	output(14) <= input(7);
	output(15) <= input(7);
end architecture; 