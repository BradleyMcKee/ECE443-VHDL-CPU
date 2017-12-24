library ieee ;
use ieee.std_logic_1164.all;

---------------------------------------------

entity Subtractor_16 is
port(	  
	A, B	:	in std_logic_vector(15 downto 0);
	S		:	out std_logic_vector(15 downto 0);
	SignBit	:	out std_logic
);
end Subtractor_16;

architecture Structural of Subtractor_16 is

Component FullAdder
	port (
	A, B, Cin	:	in std_logic;
	S, Cout		:	out std_logic
	);
end component;

signal CarryBit, notB : std_logic_vector(15 downto 0);

begin				 
	-- Subtractor requires the 2's compliment of an operand. Negate B, the 1 will be added by the first adder's carry in
	notB <= not B after 10 ns;
	
	-- Implement the 16 bit Subtractor using a generate statment to create the array of 16 subtractors while inverting B
	AdderGenerate: for I in 0 to 15 generate 	-- 16 bits
    	ZA : if I=0 generate					-- For the zeroith bit use a Full adder with a carry in of 1
    		LowerBit: FullAdder port map (A(I),notB(I),'1',S(I),CarryBit(I));
    	end generate ZA;
    	FA : if I>0 generate					-- For the other bits use a full adder with the prevous Carry out as this carry in
    		UpperBit: FullAdder port map (A(I),notB(I),CarryBit(I-1),S(I),CarryBit(I));
    	end generate FA;
    end generate AdderGenerate;

    -- Map the sign bit for the subtractor
    SignBit <= not CarryBit(15) after 10 ns;
end architecture; 