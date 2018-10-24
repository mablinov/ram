library ieee;
use ieee.std_logic_1164.all;

entity ramb64x8 is
	generic (
		INIT_FILE_UPPER_0: string := "NONE";
		INIT_FILE_LOWER_0: string := "NONE";

		INIT_FILE_UPPER_1: string := "NONE";
		INIT_FILE_LOWER_1: string := "NONE";

		INIT_FILE_UPPER_2: string := "NONE";
		INIT_FILE_LOWER_2: string := "NONE";

		INIT_FILE_UPPER_3: string := "NONE";
		INIT_FILE_LOWER_3: string := "NONE";

		INIT_FILE_UPPER_4: string := "NONE";
		INIT_FILE_LOWER_4: string := "NONE";

		INIT_FILE_UPPER_5: string := "NONE";
		INIT_FILE_LOWER_5: string := "NONE";

		INIT_FILE_UPPER_6: string := "NONE";
		INIT_FILE_LOWER_6: string := "NONE";

		INIT_FILE_UPPER_7: string := "NONE";
		INIT_FILE_LOWER_7: string := "NONE"
	);
	port (
		-- Port A controls
		CLKA: in std_logic;
		ADDRA: in std_logic_vector(15 downto 0);
		DIA: in std_logic_vector(7 downto 0);
		DOA: out std_logic_vector(7 downto 0);
		
		ENA: in std_logic;
		REGCEA: in std_logic;
		RSTRAMA: in std_logic;
		RSTREGA: in std_logic;
		WEA: in std_logic;
		
		-- Port B controls
		CLKB: in std_logic;
		ADDRB: in std_logic_vector(15 downto 0);
		DIB: in std_logic_vector(7 downto 0);
		DOB: out std_logic_vector(7 downto 0);
		
		ENB: in std_logic;
		REGCEB: in std_logic;
		RSTRAMB: in std_logic;
		RSTREGB: in std_logic;
		WEB: in std_logic
	);
end entity;

architecture structural of ramb64x8 is
begin

	ramb64x1_inst_0: entity work.ramb64x1(structural)
	generic map (
		INIT_FILE_UPPER => INIT_FILE_UPPER_0,
		INIT_FILE_LOWER => INIT_FILE_LOWER_0
	)
	port map (
		CLKA => CLKA,
		ADDRA => addra,
		DIA => dia(0),
		DOA => doa(0),
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => rstrama,
		RSTREGA => rstrega,
		WEA => wea,
		
		CLKB => CLKB,
		ADDRB => addrb,
		DIB => dib(0),
		DOB => dob(0),

		ENB => enb,
		REGCEB => regceb,
		RSTRAMB => rstramb,
		RSTREGB => rstregb,
		WEB => web
	);

	ramb64x1_inst_1: entity work.ramb64x1(structural)
	generic map (
		INIT_FILE_UPPER => INIT_FILE_UPPER_1,
		INIT_FILE_LOWER => INIT_FILE_LOWER_1
	)
	port map (
		CLKA => clka,
		ADDRA => addra,
		DIA => dia(1),
		DOA => doa(1),
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => rstrama,
		RSTREGA => rstrega,
		WEA => wea,
		
		CLKB => clkb,
		ADDRB => addrb,
		DIB => dib(1),
		DOB => dob(1),

		ENB => enb,
		REGCEB => regceb,
		RSTRAMB => rstramb,
		RSTREGB => rstregb,
		WEB => web
	);

	ramb64x1_inst_2: entity work.ramb64x1(structural)
	generic map (
		INIT_FILE_UPPER => INIT_FILE_UPPER_2,
		INIT_FILE_LOWER => INIT_FILE_LOWER_2
	)
	port map (
		CLKA => clka,
		ADDRA => addra,
		DIA => dia(2),
		DOA => doa(2),
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => rstrama,
		RSTREGA => rstrega,
		WEA => wea,
		
		CLKB => clkb,
		ADDRB => addrb,
		DIB => dib(2),
		DOB => dob(2),
		
		ENB => enb,
		REGCEB => regceb,
		RSTRAMB => rstramb,
		RSTREGB => rstregb,
		WEB => web
	);

	ramb64x1_inst_3: entity work.ramb64x1(structural)
	generic map (
		INIT_FILE_UPPER => INIT_FILE_UPPER_3,
		INIT_FILE_LOWER => INIT_FILE_LOWER_3
	)
	port map (
		CLKA => clka,
		ADDRA => addra,
		DIA => dia(3),
		DOA => doa(3),
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => rstrama,
		RSTREGA => rstrega,
		WEA => wea,
		
		CLKB => clkb,
		ADDRB => addrb,
		DIB => dib(3),
		DOB => dob(3),

		ENB => enb,
		REGCEB => regceb,
		RSTRAMB => rstramb,
		RSTREGB => rstregb,
		WEB => web
	);

	ramb64x1_inst_4: entity work.ramb64x1(structural)
	generic map (
		INIT_FILE_UPPER => INIT_FILE_UPPER_4,
		INIT_FILE_LOWER => INIT_FILE_LOWER_4
	)
	port map (
		CLKA => clka,
		ADDRA => addra,
		DIA => dia(4),
		DOA => doa(4),
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => rstrama,
		RSTREGA => rstrega,
		WEA => wea,
		
		CLKB => clkb,
		ADDRB => addrb,
		DIB => dib(4),
		DOB => dob(4),

		ENB => enb,
		REGCEB => regceb,
		RSTRAMB => rstramb,
		RSTREGB => rstregb,
		WEB => web
	);

	ramb64x1_inst_5: entity work.ramb64x1(structural)
	generic map (
		INIT_FILE_UPPER => INIT_FILE_UPPER_5,
		INIT_FILE_LOWER => INIT_FILE_LOWER_5
	)
	port map (
		CLKA => clka,
		ADDRA => addra,
		DIA => dia(5),
		DOA => doa(5),
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => rstrama,
		RSTREGA => rstrega,
		WEA => wea,
		
		CLKB => clkb,
		ADDRB => addrb,
		DIB => dib(5),
		DOB => dob(5),

		ENB => enb,
		REGCEB => regceb,
		RSTRAMB => rstramb,
		RSTREGB => rstregb,
		WEB => web
	);

	ramb64x1_inst_6: entity work.ramb64x1(structural)
	generic map (
		INIT_FILE_UPPER => INIT_FILE_UPPER_6,
		INIT_FILE_LOWER => INIT_FILE_LOWER_6
	)
	port map (
		CLKA => clka,
		ADDRA => addra,
		DIA => dia(6),
		DOA => doa(6),
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => rstrama,
		RSTREGA => rstrega,
		WEA => wea,
		
		CLKB => clkb,
		ADDRB => addrb,
		DIB => dib(6),
		DOB => dob(6),

		ENB => enb,
		REGCEB => regceb,
		RSTRAMB => rstramb,
		RSTREGB => rstregb,
		WEB => web
	);

	ramb64x1_inst_7: entity work.ramb64x1(structural)
	generic map (
		INIT_FILE_UPPER => INIT_FILE_UPPER_7,
		INIT_FILE_LOWER => INIT_FILE_LOWER_7
	)
	port map (
		CLKA => clka,
		ADDRA => addra,
		DIA => dia(7),
		DOA => doa(7),
		
		ENA => ena,
		REGCEA => regcea,
		RSTRAMA => rstrama,
		RSTREGA => rstrega,
		WEA => wea,
		
		CLKB => clkb,
		ADDRB => addrb,
		DIB => dib(7),
		DOB => dob(7),

		ENB => enb,
		REGCEB => regceb,
		RSTRAMB => rstramb,
		RSTREGB => rstregb,
		WEB => web
	);

end;

