library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----MAKE AND GATE

entity nandGate is port(
    A,B,C : in std_logic;
    F : out std_logic
);
end nandGate;

architecture behave of nandGate is begin
F <= A nand B AFTER 10 ns;
end behave;