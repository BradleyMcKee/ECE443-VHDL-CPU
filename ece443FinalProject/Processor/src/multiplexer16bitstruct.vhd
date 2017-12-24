library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity multiplexer16bit is port(
	A,B : in std_logic_vector (15 downto 0);
	state : in std_logic_vector (2 downto 0);
	outputState : out std_logic_vector (2 downto 0);
	overflow : out std_logic;
	RESULT : out signed (31 downto 0));
end entity;

architecture struct of multiplexer16bit is

component multi16bit is port(
	A,B :in unsigned (15 downto 0);
	RESULT :out unsigned (31 downto 0);
	overflow : out std_logic);
end component;


component orGate is port(
         A, B, C : in std_logic;
            F : out std_logic);
end component;

component andGate is port(
         A, B, C: in std_logic;
               O : out std_logic);
end component;

component nandGate is port(
	A,B,C : in std_logic;
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
signal S2, S1, S0,SN0,SN1,SN2,outty,into,carry: std_logic := '0'; 

  
signal int,passA,passB,plus,sub: integer;
signal i32: std_logic_vector (31 downto 0);	
signal i16: std_logic_vector (15 downto 0);

signal unsignedi16,multiB,multiA,Addd,subb : unsigned (15 downto 0);
signal unsignedi32 : unsigned (31 downto 0);

begin
	
S2 <= state(0);
S1 <= state(1);
S0 <= state(2);


nostate: notGate port map(S2,SN2);
nostate1: notGate port map(S1,SN1);
nostate2: notGate port map(S0,SN0);
 ---000	    A+B
comp1:   nandGate port map(S2,S1,S0,outty);
addbit:  adder16bit port map(A,B,into,i16,into); -- PUTS ANSWER INTO i16 / A+B
add1: 		Addd <= unsigned(i16);
add2:		plus <= to_integer(Addd);
add3: 	RESULT <= to_signed(plus,32);	 
 ---001	    A*B
comp2:  andGate port map(S2,S1,SN0,outty);
convertvect2unsignedA:  multiA <= unsigned(A);
convertvect2unsignedB:  multiB <= unsigned(B);
--multibit: multi16bit port map(multiA,multiB,unsignedi32,overflow);  FIX THIS LINE	  
convert2int: int <= to_integer(unsignedi32);
convert2ans: RESULT <= to_signed(int,32); 

---010		PASS A
comp3:   andGate port map(S2,SN1,S0,outty);
convert2intA: unsignedi16 <= unsigned(A);
pushA: 		passA <= to_integer(unsignedi16);
pushA2: 	RESULT <= to_signed(passA,32);	

---011		PASS B
comp4:   andGate port map(S2,SN1,SN0,outty);
convert2intB: unsignedi16 <= unsigned(B);
pushB: 		passB <= to_integer(unsignedi16);
pushB2: 	RESULT <= to_signed(passB,32);
---100 		A-B
comp5:   andGate port map(SN2,S1,S0,outty);
subbit:  sub16bit port map(A,B,into,i16,into); -- PUTS ANSWER INTO i16 / A-B   
sub1: 		subb <= unsigned(i16);
sub2:		sub <= to_integer(subb);
sub3: 	RESULT <= to_signed(plus,32);




end struct;