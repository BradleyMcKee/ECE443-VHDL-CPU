library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity multiplexer16bit is port(
	A,B : in std_logic_vector (15 downto 0);
	state : in std_logic_vector (2 downto 0);
	outputState : out std_logic_vector (2 downto 0);
	RESULT : out signed (31 downto 0)
);
end entity;

architecture behave of multiplexer16bit is

component multi16bit is port(
	A,B :in unsigned (15 downto 0);
	RESULT :out unsigned (31 downto 0);
	overflow : out std_logic
);
end component;

component orGate is port(
         A, B : in std_logic;
            F : out std_logic);
end component;

component andGate is port(
         A, B, C : in std_logic;
               F : out std_logic);
end component;

component notGate is port(
         A : in std_logic;
         O : out std_logic);
end component; 

component adder16bit is port(
	A,B : in std_logic_vector(15 downto 0);
	C   : in std_logic;
	RESULT   : out std_logic_vector(15 downto 0);
	Cout : out std_logic
);
end component;

component sub16bit is port(
	A,B : in std_logic_vector(15 downto 0);
	C   : in std_logic;
	RESULT   : out std_logic_vector(15 downto 0);
	Cout : out std_logic
);
end component;
 --MOVE THE STATE SELECTED INTO S0-2 (MULTIPLEXER OPERATION)
--signal S2, S1, S0: STD_LOGIC;
--S2 <= state(0);
--S1 <= state(1);
--S0 <= state(2);  
signal int: integer;
signal i32: std_logic_vector (31 downto 0);	
signal i16: std_logic_vector (15 downto 0);

signal unsignedi16 : unsigned (15 downto 0);
signal unsignedi32 : unsigned (31 downto 0);

begin
	process (state,A,B)
	begin
		case  state is
when "000" => i16 <= A+B;
		unsignedi16 <= unsigned(i16);
		int <= to_integer(unsignedi16);
when "001" => i32 <= A*B;
		unsignedi32 <= unsigned(i32);
		int <= to_integer(unsignedi32);
when "010" => i16 <= A;	
 		unsignedi16 <= unsigned(i16);
		int <= to_integer(unsignedi16);
when "011" => i16 <= B;	
		unsignedi16 <= unsigned(i16);
		int <= to_integer(unsignedi16);
when "100" => i16 <= A-B; 
		unsignedi16 <= unsigned(i16);
		int <= to_integer(unsignedi16);
--REST IS UNDEFINED
when OTHERS => NULL;
		end case;
	end process;
	
RESULT <= to_signed(int,32);

--RESULT <= 

end behave;
		