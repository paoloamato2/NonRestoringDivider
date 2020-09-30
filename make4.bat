ghdl -a ff_et_rising.vhdl
ghdl -a ff_t.vhdl
ghdl -a counter_mod4.vhdl
ghdl -a ha.vhdl
ghdl -a fa.vhdl
ghdl -a add_sub.vhdl
ghdl -a cu.vhdl
ghdl -a shift_reg.vhdl
ghdl -a sync_reg_et_rising.vhdl
ghdl -a divisore.vhdl
ghdl -a divisore_tb.vhdl
ghdl -e divisore_tb
ghdl -r divisore_tb --vcd=out4.vcd
gtkwave out4.vcd