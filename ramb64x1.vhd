library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

entity ramb64x1 is
	generic (
		INIT_FILE_UPPER: string := "NONE";
		INIT_FILE_LOWER: string := "NONE"
	);
	port (
		-- Port A controls
		CLKA: in std_logic;
		ADDRA: in std_logic_vector(15 downto 0);
		DIA: in std_logic;
		DOA: out std_logic;
		
		ENA: in std_logic;
		REGCEA: in std_logic;
		RSTRAMA: in std_logic;
		RSTREGA: in std_logic;
		WEA: in std_logic;
		
		-- Port B controls
		CLKB: in std_logic;
		ADDRB: in std_logic_vector(15 downto 0);
		DIB: in std_logic;
		DOB: out std_logic;
		
		ENB: in std_logic;
		REGCEB: in std_logic;
		RSTRAMB: in std_logic;
		RSTREGB: in std_logic;
		WEB: in std_logic
	);
end entity;

architecture structural of ramb64x1 is
	-- Upper only
	signal DOA_INT: std_logic_vector(31 downto 0) := (others => '0');
	signal DOB_INT: std_logic_vector(31 downto 0) := (others => '0');

	-- Lower only
	signal CASCADEA: std_logic := '0';
	signal CASCADEB: std_logic := '0';

	-- Shared
	signal DIA_INT: std_logic_vector(31 downto 0) := (others => '0');
	signal DIB_INT: std_logic_vector(31 downto 0) := (others => '0');

	signal WEA_INT: std_logic_vector(3 downto 0) := (others => '0');
	signal WEB_INT: std_logic_vector(7 downto 0) := (others => '0');
begin

	DOA <= DOA_INT(0);
	DOB <= DOB_INT(0);

	DIA_INT(0) <= DIA;
	DIB_INT(0) <= DIB;

	WEA_INT(0) <= WEA;
	WEB_INT(0) <= WEB;
	
	RAMB36E1_upper: RAMB36E1
	generic map (
		RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
		SIM_COLLISION_CHECK => "ALL",
		
		DOA_REG => 1,
		DOB_REG => 1,
	
		EN_ECC_READ => FALSE,
		EN_ECC_WRITE => FALSE,
		
		INIT_A => X"000000000",
		INIT_B => X"000000000",
		
		INIT_FILE => INIT_FILE_UPPER,
		
		RAM_MODE => "TDP",
		
		RAM_EXTENSION_A => "UPPER",
		RAM_EXTENSION_B => "UPPER",
		
		READ_WIDTH_A => 1,
		READ_WIDTH_B => 1,
		
		WRITE_WIDTH_A => 1,
		WRITE_WIDTH_B => 1,
		
		RSTREG_PRIORITY_A => "RSTREG",
		RSTREG_PRIORITY_B => "RSTREG",
		
		SRVAL_A => X"000000000",
		SRVAL_B => X"000000000",
		
		SIM_DEVICE => "7SERIES",
		
		WRITE_MODE_A => "WRITE_FIRST",
		WRITE_MODE_B => "WRITE_FIRST"
	)
	port map (
		CASCADEOUTA => open,
		CASCADEOUTB => open,
		
		DBITERR => open,
		ECCPARITY => open,
		RDADDRECC => open,
		SBITERR => open,
		
		-- Port A data output
		DOADO => DOA_INT,
		DOPADOP => open,
		
		-- Port A data input
		DIADI => DIA_INT,
		DIPADIP => (others => '0'),
		
		-- Port A address control signals
		ADDRARDADDR => ADDRA,
		CLKARDCLK => CLKA,
		ENARDEN => ENA,
		REGCEAREGCE => REGCEA,
		RSTRAMARSTRAM => RSTRAMA,
		RSTREGARSTREG => RSTREGA,
		WEA => WEA_INT,
		
		-- Port B data output
		DOBDO => DOB_INT,
		DOPBDOP => open,
		
		-- Port B data input
		DIBDI => DIB_INT,
		DIPBDIP => (others => '0'),
		
		-- Port B address control signals
		ADDRBWRADDR => ADDRB,
		CLKBWRCLK => CLKB,
		ENBWREN => ENB,
		REGCEB => REGCEB,
		RSTRAMB => RSTRAMB,
		RSTREGB => RSTREGB,
		WEBWE => WEB_INT,
		
		-- Cascade signals
		CASCADEINA => CASCADEA,
		CASCADEINB => CASCADEB,
		
		-- ECC signals
		INJECTDBITERR => '0',
		INJECTSBITERR => '0'
	);

	RAMB36E1_lower: RAMB36E1
	generic map (
		RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
		SIM_COLLISION_CHECK => "ALL",
		
		DOA_REG => 1,
		DOB_REG => 1,
	
		EN_ECC_READ => FALSE,
		EN_ECC_WRITE => FALSE,
		
		INIT_A => X"000000000",
		INIT_B => X"000000000",
		
		INIT_FILE => INIT_FILE_LOWER,
		
		RAM_MODE => "TDP",
		
		RAM_EXTENSION_A => "LOWER",
		RAM_EXTENSION_B => "LOWER",
		
		READ_WIDTH_A => 1,
		READ_WIDTH_B => 1,
		
		WRITE_WIDTH_A => 1,
		WRITE_WIDTH_B => 1,
		
		RSTREG_PRIORITY_A => "RSTREG",
		RSTREG_PRIORITY_B => "RSTREG",
		
		SRVAL_A => X"000000000",
		SRVAL_B => X"000000000",
		
		SIM_DEVICE => "7SERIES",
		
		WRITE_MODE_A => "WRITE_FIRST",
		WRITE_MODE_B => "WRITE_FIRST"
	)
	port map (
		CASCADEOUTA => CASCADEA,
		CASCADEOUTB => CASCADEB,
		
		DBITERR => open,
		ECCPARITY => open,
		RDADDRECC => open,
		SBITERR => open,
		
		-- Port A data output
		DOADO => open,
		DOPADOP => open,
		
		-- Port A data input
		DIADI => DIA_INT,
		DIPADIP => (others => '0'),
		
		-- Port A address control signals
		ADDRARDADDR => ADDRA,
		CLKARDCLK => CLKA,
		ENARDEN => ENA,
		REGCEAREGCE => REGCEA,
		RSTRAMARSTRAM => RSTRAMA,
		RSTREGARSTREG => RSTREGA,
		WEA => WEA_INT,
		
		-- Port B data output
		DOBDO => open,
		DOPBDOP => open,
		
		-- Port B data input
		DIBDI => DIB_INT,
		DIPBDIP => (others => '0'),
		
		-- Port B address control signals
		ADDRBWRADDR => ADDRB,
		CLKBWRCLK => CLKB,
		ENBWREN => ENB,
		REGCEB => REGCEB,
		RSTRAMB => RSTRAMB,
		RSTREGB => RSTREGB,
		WEBWE => WEB_INT,
		
		-- Cascade signals
		CASCADEINA => '0',
		CASCADEINB => '0',
		
		-- ECC signals
		INJECTDBITERR => '0',
		INJECTSBITERR => '0'
	);
end architecture;


