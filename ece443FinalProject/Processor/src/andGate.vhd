library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----MAKE AND GATE

entity andGate is port(
    A,B,C : in STD_LOGIC;
    O : out STD_LOGIC
);
end andGate;

architecture behave of andGate is begin
O <= A and (B and C)  AFTER 10 ns;
end behave;

  