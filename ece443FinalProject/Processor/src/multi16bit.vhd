library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--multiplying bits should be unsigned then multiplied or added multiple times.  
entity multi16bit is port(
	A,B :in std_logic_vector (15 downto 0);					  --unsigned
	RESULT :out std_logic_vector (31 downto 0);		--unsigned
	overflow : out std_logic
);
end entity;

architecture behaviorModel of multi16bit is
begin			 
	--behavioral > structural
	process (A,B)
	begin
		
		RESULT <= A * B;
conditionforOverflow: if (RESULT'length > 16) then
		overflow <= '1';
		end if;
	end process;
end behaviorModel;
		