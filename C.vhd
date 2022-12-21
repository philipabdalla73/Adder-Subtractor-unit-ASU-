LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY C IS
PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
Sign : IN STD_LOGIC;
leds : OUT STD_LOGIC_VECTOR(1 TO 7);
ledss : OUT STD_LOGIC_VECTOR(1 TO 7));
END C;

ARCHITECTURE Behavior OF C IS
BEGIN
PROCESS ( bcd )
BEGIN
CASE bcd IS          -- abcdefg
WHEN "0000" => leds <= "1011011";--5
WHEN "0001" => leds <= "1111110";--0
WHEN "0010" => leds <= "0110000";--1
WHEN "0011" => leds <= "1111110";--0
WHEN "0100" => leds <= "1111111";--8
WHEN "0101" => leds <= "1110011";--9
WHEN "0110" => leds <= "0110011";--4
WHEN "0111" => leds <= "1101101";--3
WHEN "1000" => leds <= "1110011";--1
WHEN OTHERS => leds <= "-------" ;
END CASE ;
CASE Sign IS     -- abcdefg
WHEN '1' => ledss <= "0000001";
WHEN '0' => ledss <= "0000000";
WHEN OTHERS => leds <= "-------" ;
END CASE ;
END PROCESS ;
END Behavior ;