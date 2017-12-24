library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerFile is
	port(
	clk, regWrite		: in std_logic;
	data2Write			: in std_logic_vector (15 downto 0);
	write2Reg,	register1, register2	: in std_logic_vector (3 downto 0);
	register1Data, register2Data		: out std_logic_vector (15 downto 0)
	);
end entity registerFile;


architecture behavioral of registerFile is
	type ram is array (0 to 15) of std_logic_vector(15 downto 0);
	signal registerFile: ram := (others => (others =>'0'));   
begin
	process(clk)
	begin
		if clk = '1' and regWrite = '1' then
			registerFile(to_integer(unsigned(write2Reg))) <= data2Write;
		end if;
	end process;
	register1Data <= registerFile(to_integer(unsigned(register1)));
	register2Data <= registerFile(to_integer(unsigned(register2)));
end architecture;