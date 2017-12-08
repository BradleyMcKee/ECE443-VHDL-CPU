library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--CREATE ORGATE W/ DELAY
entity orGate is port(
    A,B : in STD_LOGIC;
    O : out STD_LOGIC
);
end orGate;   

architecture behave of orGate is begin
O <= A or B AFTER 10 ns;
end behave;