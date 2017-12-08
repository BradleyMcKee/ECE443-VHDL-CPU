-- Bradley McKee

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is port(
    A,B,Cin : IN STD_LOGIC;
    Sum,Cout  : OUT STD_LOGIC);
end entity;

architecture STRUCTURAL of fulladder is
signal i: std_logic_vector(0 to 2) := (OTHERS => '0');

component and2Gate is port(
    A,B : in std_logic;
    O : out std_logic
);
end component;

component xorGate is port(
    A,B : in std_logic;
    O : out std_logic
);
end component;

component orGate is port(
    A,B : in std_logic;
    O : out std_logic
);
end component;

component halfadder is port(
      A,B   : IN std_logic;
      C,Sum : OUT std_logic
);
end component;

begin

halfadd1: halfadder port map(A,B,i(0),i(2));
halfadd2: halfadder port map(i(0),Cin,i(1),Sum);
last: orGate port map(i(1),i(2),Cout);		


end architecture;