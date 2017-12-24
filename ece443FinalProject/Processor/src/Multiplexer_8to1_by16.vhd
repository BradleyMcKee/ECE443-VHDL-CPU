library ieee ;
use ieee.std_logic_1164.all;

---------------------------------------------

entity Multiplexer_8to1_by16 is
port(	  
	D0, D1, D2, D3, D4, D5, D6, D7	:	in std_logic_vector(15 downto 0);
	S0, S1, S2						:	in std_logic;	-- S2 is msb, S0 is lsb
	F								:	out std_logic_vector(15 downto 0)
);
end Multiplexer_8to1_by16;

architecture Structural of Multiplexer_8to1_by16 is

Component Multiplexer_8to1
	port(	  
		D0, D1, D2, D3, D4, D5, D6, D7	:	in std_logic;
		S0, S1, S2						:	in std_logic;
		F								:	out std_logic
	);					 
end component;	 

begin					
	-- Take the 8 to 1 mux and make it 16 bits wide
	muxGen: for I in 0 to 15 generate
		mux: Multiplexer_8to1 port map (D0(I),D1(I),D2(I),D3(I),D4(I),D5(I),D6(I),D7(I),S0,S1,S2,F(I));
	end generate muxGen;
end architecture; 