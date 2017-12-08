library ieee;
use ieee.std_logic_1164.all;

entity ProgramCounter is
	port(
	clk		: in std_logic;
	nextIns	: in std_logic_vector (4 downto 0);
	PC		: out std_logic_vector (4 downto 0)
);
end ProgramCounter;

architecture behave of ProgramCounter is
begin
	Process(clk)
	begin
		if rising_edge(clk) then
			PC <= nextIns;
		end if;
	end Process;
end architecture;