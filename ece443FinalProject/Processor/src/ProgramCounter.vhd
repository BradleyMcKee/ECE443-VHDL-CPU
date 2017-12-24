library ieee;
use ieee.std_logic_1164.all;

entity ProgramCounter is
	port(
	clk		: in std_logic;
	nextIns	: in std_logic_vector (4 downto 0);
	PC		: out std_logic_vector (4 downto 0)
);
end ProgramCounter;

--This will allow the counter to increment on the falling edge of the clock cycle
architecture behave of ProgramCounter is
begin
	Process(clk)
	begin
		if falling_edge(clk) then
			PC <= nextIns;
		end if;
	end Process;
end architecture;