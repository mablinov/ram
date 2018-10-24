library ieee;
use ieee.std_logic_1164.all;

entity ramb64x8_tb is
end entity;

architecture behavioural of ramb64x8_tb is
	constant p: time := 10 ns;
	signal clk: std_logic := '1';
	
	signal addra: std_logic_vector(15 downto 0) := (others => '0');
	signal dia: std_logic_vector(7 downto 0) := X"00";
	signal doa: std_logic_vector(7 downto 0) := X"00";
	
	signal ena: std_logic := '0';
	signal regcea: std_logic := '0';
	signal wea: std_logic := '0';
	
	signal addrb: std_logic_vector(15 downto 0) := (others => '0');
	signal dib: std_logic_vector(7 downto 0) := X"00";
	signal dob: std_logic_vector(7 downto 0) := X"00";
	
	signal enb: std_logic := '0';
	signal regceb: std_logic := '0';
	signal web: std_logic := '0';

	-- Test read from port A
	procedure tra(
		signal a: out std_logic_vector(15 downto 0);
		signal ena, regcea: out std_logic;
		constant address: std_logic_vector(15 downto 0)) is
	begin
		a <= address;
		ena <= '1';
		
		wait for p;
		a <= X"0000";
		ena <= '0';
		regcea <= '1';
		
		wait for p;
		regcea <= '0';
	end procedure;
	
	-- Test write to port A
	procedure twa(
		signal a: out std_logic_vector(15 downto 0);
		signal do: out std_logic_vector(7 downto 0);
		signal ena, wea: out std_logic;
		constant address: std_logic_vector(15 downto 0);
		constant data: std_logic_vector(7 downto 0)) is
	begin
		a <= address;
		do <= data;
		ena <= '1';
		wea <= '1';
		
		wait for p;
		a <= X"0000";
		do <= X"00";
		ena <= '0';
		wea <= '0';
		
		wait for p;
	end procedure;
	
	
begin
	clk <= not clk after p/2;

	testbench: process
		constant highloc: std_logic_vector(15 downto 0) := X"F700";
	begin
		wait for 5*p;

		twa(addra, dia, ena, wea, highloc, X"FF");
		wait for p;
		tra(addra, ena, regcea, highloc);

		wait;
	end process;

	uut: entity work.ramb64x8(structural)
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
