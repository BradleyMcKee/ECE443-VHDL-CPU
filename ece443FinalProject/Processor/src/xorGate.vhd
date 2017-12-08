library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--CREATE XORGATE W/ DELAY
entity xorGate is port(
    A,B : in STD_LOGIC;
    O : out STD_LOGIC
);
end xorGate;   

architecture behave of xorGate is begin
O <= A xor B AFTER 10 ns;
end behave;