-- 2 to 1 mux, 4 buts wide	 
-- made out of 4 2 to 1 mux's
library ieee ;
use ieee.std_logic_1164.all;

---------------------------------------------

entity Multiplexer_2to1_by16 is
port(	  
	D0, D1	:	in std_logic_vector(15 downto 0);
	Control	:	in std_logic;
	F		:	out std_logic_vector(15 downto 0)
);
end Multiplexer_2to1_by16;

architecture Structural of Multiplexer_2to1_by16 is

Component Multiplexer_2to1
	port(	  
		D0, D1	:	in std_logic;
		Control	:	in std_logic;
		F		:	out std_logic
	);					 
end component;	 

begin					
	-- Take the 2 to 1 mux and make it 16 bits wide
	muxGen: for I in 0 to 15 generate
		mux: Multiplexer_2to1 port map (D0(I),D1(I),Control,F(I));
	end generate muxGen;
end architecture;
