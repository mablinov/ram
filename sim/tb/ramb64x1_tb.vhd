library ieee;
use ieee.std_logic_1164.all;

entity ramb64x1_tb is
end entity;

architecture behavioural of ramb64x1_tb is
	signal clk: std_logic := '1';
	
	signal addra: std_logic_vector(15 downto 0) := (others => '0');
	signal dia: std_logic := '0';
	signal doa: std_logic := '0';
	
	signal ena: std_logic := '0';
	signal regcea: std_logic := '0';
	signal wea: std_logic := '0';
	
	signal addrb: std_logic_vector(15 downto 0) := (others => '0');
	signal dib: std_logic := '0';
	signal dob: std_logic := '0';
	
	signal enb: std_logic := '0';
	signal regceb: std_logic := '0';
	signal web: std_logic := '0';

	constant p: time := 10 ns;	
begin
	clk <= not clk after p/2;

	testbench: process
	begin
		wait for 5*p;
		report "Now starting testbench." severity note;
				
		addra <= X"0005";
		ena <= '1';		
		wait for p;
		
		addra <= X"0000";
		ena <= '0';
		regcea <= '1';
		wait for p;
		
		regcea <= '0';
		-- Now we have the data. Lets try writing something.

		addra <= X"0005";
		ena <= '1';
		wea <= '1';
		dia <= '1';
		wait for p;
		
		addra <= X"0000";
		ena <= '0';
		wea <= '0';
		dia <= '0';
		regcea <= '1';
		wait for p;
		
		regcea <= '0';
		-- Now we have the data again.
		
		report "Done." severity note;
		wait;
	end process;

	uut: entity work.ramb64x1(structural)
	port map (
		CLKA => clk,
		ADDRA => addra,
		DIA => dia,
		DOA => doa,
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => '0',
		RSTREGA => '0',
		WEA => wea,
		
		CLKB => clk,
		ADDRB => addrb,
		DIB => dib,
		DOB => dob,
		
		ENB => '0',
		REGCEB => '0',
		RSTRAMB => '0',
		RSTREGB => '0',
		WEB => '0'
	);

end architecture;
