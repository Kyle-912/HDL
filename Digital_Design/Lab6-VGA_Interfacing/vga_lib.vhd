-- Greg Stitt
-- University of Florida
library ieee;
use ieee.std_logic_1164.all;
package VGA_LIB is
  -----------------------------------------------------------------------------
  -- COUNTER VALUES FOR GENERATING H_SYNC AND V_SYNC (Feel free to adjust)
  constant H_DISPLAY_END  : integer := 639;
  constant HSYNC_BEGIN    : integer := 659;
  constant H_VERT_INC     : integer := 699;
  constant HSYNC_END      : integer := 755;
  constant H_MAX          : integer := 799;
  constant V_DISPLAY_END  : integer := 479;
  constant VSYNC_BEGIN    : integer := 493;
  constant VSYNC_END      : integer := 495;
  constant V_MAX          : integer := 524;
  -----------------------------------------------------------------------------
  -- CONSTANTS FOR SIGNAL WIDTHS
  constant ROM_ADDR_WIDTH : integer := 12; --128: 12->14
  constant RESOLUTION     : integer := 2;  --128: 2->1
  subtype ROM_ADDR_RANGE is natural range ROM_ADDR_WIDTH - 1 downto 0;
  subtype ROM_ADDR_TOP_HALF_RANGE is natural range ROM_ADDR_WIDTH - 1 downto ROM_ADDR_WIDTH/2;
  subtype ROM_ADDR_BOTTOM_HALF_RANGE is natural range (ROM_ADDR_WIDTH/2) - 1 downto 0;
  constant COUNT_WIDTH : integer := 10;
  subtype COUNT_RANGE is natural range COUNT_WIDTH - 1 downto 0;
  -----------------------------------------------------------------------------
  -- CONSTANTS FOR SELECTING ROM
  constant ROM_SELECT           : integer          := 1; --128: 1->2 --image: 1->3
  -----------------------------------------------------------------------------
  -- CONSTANTS DEFINING PIXEL BOUNDARIES OF THE IMAGE FOR EACH IMAGE LOCATION
  constant TOP_LEFT_X_START     : integer          := 0;
  constant TOP_LEFT_X_END       : integer          := 127;
  constant TOP_LEFT_Y_START     : integer          := 0;
  constant TOP_LEFT_Y_END       : integer          := 127;
  constant TOP_RIGHT_X_START    : integer          := 512;
  constant TOP_RIGHT_X_END      : integer          := 639;
  constant TOP_RIGHT_Y_START    : integer          := 0;
  constant TOP_RIGHT_Y_END      : integer          := 127;
  constant BOTTOM_RIGHT_X_START : integer          := 512;
  constant BOTTOM_RIGHT_X_END   : integer          := 639;
  constant BOTTOM_RIGHT_Y_START : integer          := 352;
  constant BOTTOM_RIGHT_Y_END   : integer          := 479;
  constant BOTTOM_LEFT_X_START  : integer          := 0;
  constant BOTTOM_LEFT_X_END    : integer          := 127;
  constant BOTTOM_LEFT_Y_START  : integer          := 352;
  constant BOTTOM_LEFT_Y_END    : integer          := 479;
  constant CENTERED_X_START     : integer          := 256;
  constant CENTERED_X_END       : integer          := 383;
  constant CENTERED_Y_START     : integer          := 176;
  constant CENTERED_Y_END       : integer          := 303;
  -----------------------------------------------------------------------------
  -- CONSTANTS FOR BUTTON PRESSES
  constant CENTERED             : std_logic_vector := "000";
  constant TOP_LEFT             : std_logic_vector := "001";
  constant TOP_RIGHT            : std_logic_vector := "011";
  constant BOTTOM_LEFT          : std_logic_vector := "100";
  constant BOTTOM_RIGHT         : std_logic_vector := "101";
end VGA_LIB;