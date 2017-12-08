library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--CREATE notGATE W/ DELAY
entity notGate is port(
    A: in STD_LOGIC;
    O : out STD_LOGIC
);
end notGate;   

architecture behave of notGate is begin
O <= not A after 10 ns;
end behave;