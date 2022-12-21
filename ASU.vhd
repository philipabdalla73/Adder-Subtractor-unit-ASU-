LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
ENTITY ASU IS
PORT ( Cin : IN STD_LOGIC ;
CTR: IN STD_LOGIC;
X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
Cout, Overflow, Sign : OUT STD_LOGIC ) ;
END ASU ;
ARCHITECTURE Behavior OF ASU IS
signal Yc: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Sum : STD_LOGIC_VECTOR(4 DOWNTO 0) ;
Signal Sumc: STD_LOGIC_VECTOR(3 DOWNTO 0);
Signal S_sig: STD_LOGIC_VECTOR(4 DOWNTO 0);
Signal Cout_sig: STD_LOGIC;
SIGNAL sign_sig: STD_LOGIC;
BEGIN
Yc <= Y XOR (CTR&CTR&CTR&CTR);
Sum <= ('0' & X) + ('0' & Yc) + CTR ;
Cout_sig <= Sum(4);
sign_sig <= NOT(Cout_sig) AND CTR;

Sumc <= Sum(3 DOWNTO 0) XOR (sign_sig&sign_sig&sign_sig&sign_sig);
S_sig <= ("00000") + ('0' & Sumc) + sign_sig ;
Sign <= sign_sig;
Cout <= Cout_sig ;
S <= S_sig(3 DOWNTO 0);
Overflow <= Sum(4) XOR X(3) XOR Yc(3) XOR Sum(3);
END Behavior ;