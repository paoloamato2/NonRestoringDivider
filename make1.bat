ghdl --clean
ghdl -a ha.vhdl
ghdl -a fa.vhdl
ghdl -a add_sub.vhdl
ghdl -a add_sub_tb.vhdl
ghdl -e add_sub_tb
ghdl -r add_sub_tb --vcd=out.vcd
gtkwave out.vcd