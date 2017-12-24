library ieee ;
use ieee.std_logic_1164.all;

---------------------------------------------

entity Multiplexer_2to1 is
port(	  
	D0, D1		:	in std_logic;
	Control	:	in std_logic;
	F			:	out std_logic
);
end Multiplexer_2to1;

architecture Structural of Multiplexer_2to1 is
begin
	F <= (D0 AND NOT Control) OR
		 (D1 AND Control);
end architecture; 