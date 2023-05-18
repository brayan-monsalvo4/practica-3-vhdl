library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    port(
        ALUSEL : in std_logic;
        op1 : in std_logic_vector(7 downto 0);
        op2 : in std_logic_vector(7 downto 0);
        res : out std_logic_vector(7 downto 0);
        carry : out std_logic;
        clk : in std_logic
    );
end ALU;

architecture Behavioral of ALU is
signal res_aux : unsigned(8 downto 0) := "000000000";
signal carry_aux : std_logic := '0';
signal op1_aux : unsigned(7 downto 0) := "00000000";
signal op2_aux : unsigned(7 downto 0) := "00000000";

begin
process (ALUSEL, op1, op2, clk)
begin
    if(rising_edge(clk)) then
    case ALUSEL is
        when '0' =>
            op1_aux <= unsigned(op1);
            op2_aux <= unsigned(op2);
            res_aux <= ('0' & op1_aux) + ('0' & op2_aux);  
            carry_aux <= res_aux(8);
        
        when '1' =>
            for i in 0 to 7 loop
                res_aux(i) <= op1(i) AND op2(i);
            end loop;
            carry_aux <= '0';
        when others =>
            res_aux <= "000000000";
            carry_aux <= '0';
     end case;
    end if;
end process;

res <= std_logic_vector(res_aux(7 downto 0));
carry <= carry_aux;

end Behavioral;

