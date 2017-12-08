library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----MAKE AND GATE

entity and2Gate is port(
    A,B : in STD_LOGIC;
    O : out STD_LOGIC
);
end and2Gate;

architecture behave of and2Gate is begin
O <= A and B  AFTER 10 ns;
end behave;