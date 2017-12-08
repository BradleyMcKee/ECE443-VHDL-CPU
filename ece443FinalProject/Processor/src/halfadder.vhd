-- Bradley McKee

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is port(
    A,B : in std_logic;
      C,Sum : out std_logic
);
end halfadder;

architecture structure of halfadder is

    --IMPORT GATE COMPONENTS
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
--MAPPING OF GATES
begin
    gate1 : xorGate port map(A,B,sum);
    gate2 : and2Gate port map(A,B,C);
end structure;
