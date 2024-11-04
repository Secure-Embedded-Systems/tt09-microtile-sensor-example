# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start test with inverted clock")

    # Set the clock period to 10 us (100 KHz) and start it
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset sequence
    dut._log.info("Reset")
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    # Inverted clock test
    dut._log.info("Testing behavior with inverted clock")
    await ClockCycles(dut.clk, 10)  # Run for 10 cycles to observe behavior

    dut._log.info("End of test")

