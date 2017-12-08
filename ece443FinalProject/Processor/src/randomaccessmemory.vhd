--Impletement 256 x 16 addresses for RAM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
	port (
	clk		  	:	in std_logic;
	write		: 	in std_logic;
	address		:	in std_logic_vector (15 downto 0);
	inputData  	:	in std_logic_vector (15 downto 0);
	outputData	:	out std_logic_vector (15 downto 0)
);
end entity ram;

architecture behavioral of ram is
--create an array for ram
	type ramAddy is array (0 to 255) of std_logic_vector (15 downto 0);
	signal mem : ramAddy := ((others => (others=>'0')));
	signal readAddy : std_logic_vector (15 downto 0 );
	
begin
	RAMprocedure : process (clk) is
	begin
		if falling_edge(clk)	then
			if write = '1'  then
				mem(to_integer(unsigned(address))) <= inputData;
			end if;
			readAddy <= address;
		end if;
	end process;
	
	outputData <= mem(to_integer(unsigned(readAddy)));

				
end architecture behavioral;