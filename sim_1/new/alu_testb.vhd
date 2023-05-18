library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_testb is
--  Port ( );
end alu_testb;

architecture Behavioral of alu_testb is

signal operando1 : std_logic_vector(7 downto 0);
signal operando2 : std_logic_vector(7 downto 0);
signal carry : std_logic := '0';
signal resultado : std_logic_vector(7 downto 0);
signal operacion : std_logic := '0';
signal clk : std_logic := '1';

begin

uut : entity work.ALU port map(
    ALUSEL => operacion,
    op1 => operando1,
    op2 => operando2,
    res => resultado,
    carry => carry,
    clk => clk
);

process
begin
    while true loop
        clk <= not clk;
        wait for 10 ns; 
    end loop;
end process;

operando1 <= "11111111";
operando2 <= "11111110";

end Behavioral;
