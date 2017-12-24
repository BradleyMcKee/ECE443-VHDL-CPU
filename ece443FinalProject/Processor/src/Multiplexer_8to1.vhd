library ieee ;
use ieee.std_logic_1164.all;

---------------------------------------------

entity Multiplexer_8to1 is
port(	  
	D0, D1, D2, D3, D4, D5, D6, D7	:	in std_logic;
	S0, S1, S2						:	in std_logic;  -- S2 is msb, S0 is lsb
	F								:	out std_logic
);
end Multiplexer_8to1;

architecture Structural of Multiplexer_8to1 is
begin
	F <= (D0 AND NOT S2 AND NOT S1 AND NOT S0) OR
		 (D1 AND NOT S2 AND NOT S1 AND     S0) OR
		 (D2 AND NOT S2 AND     S1 AND NOT S0) OR
		 (D3 AND NOT S2 AND     S1 AND     S0) OR
		 (D4 AND     S2 AND NOT S1 AND NOT S0) OR
		 (D5 AND     S2 AND NOT S1 AND     S0) OR
		 (D6 AND     S2 AND     S1 AND NOT S0) OR
		 (D7 AND     S2 AND     S1 AND     S0);
end architecture; 