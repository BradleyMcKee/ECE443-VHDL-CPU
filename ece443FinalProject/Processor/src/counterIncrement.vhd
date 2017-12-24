library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	
use ieee.std_logic_unsigned.all;


entity incremental is
	port(
	progcount	: in std_logic_vector (4 downto 0);
	pcNext		: out std_logic_vector (4 downto 0)
);
end incremental;

architecture behave of incremental is
signal unsignpg : unsigned (4 downto 0);   
signal unsignpg2 : unsigned (4 downto 0);
signal numint : integer;
begin
	--take the program counter, convert it to integers, add 4 to the counter then convert back.
	unsignpg <= unsigned(progcount);
	numint <= (to_integer(unsignpg)+4);
	
	--convert the process back
	unsignpg <= (to_unsigned(numint,5)); 
	pcNext <= std_logic_vector(unsignpg);
	
end architecture;