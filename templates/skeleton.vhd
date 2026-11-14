library ieee;
  use ieee.std_logic_1164.all;

entity [:VIM_EVAL:]substitute(expand('%:t'), '\.vhd$', '', '')[:END_EVAL:] is
  port (
    a : in    std_logic;
    y : out   std_logic
  );

end entity [:VIM_EVAL:]substitute(expand('%:t'), '\.vhd$', '', '')[:END_EVAL:];

architecture df of [:VIM_EVAL:]substitute(expand('%:t'), '\.vhd$', '', '')[:END_EVAL:] is

begin

  y <= a;

end architecture df;

