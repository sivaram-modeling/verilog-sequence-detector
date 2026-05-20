# verilog-sequence-detector
# Zero-Latency Sequence Detector ("0110")

## Overview
This project implements a highly optimized Mealy Finite State Machine (FSM) designed to detect the overlapping sequence `0110`. It is written in Verilog and verified using a custom testbench to ensure proper setup and hold times.

## Architecture Choices
* **Single-Variable State Tracking:** This design eliminates the traditional Next-State (`ns`) variable. State transition logic is calculated and assigned directly within the synchronous clocked block (`always @(posedge clk)`), streamlining the code and reducing intermediate signal overhead.
* **Combinational Output:** The output logic (`z`) is separated into a dedicated, unclocked block (`always @(ps, x)`). Because it is purely combinational, the system achieves **zero-cycle latency**. The output `z` spikes to `1` the exact nanosecond the final input completes the sequence, without waiting for the next clock edge.

## Verification
The testbench includes a Power-On Reset (POR) sequence to safely initialize the physical hardware states. Inputs are explicitly offset from the clock's positive edge (e.g., `#12` delay against a `#5` clock) to accurately simulate real-world propagation delays and prevent meta-stability violations.

*(Drop your EPWave screenshot here to show how the output reacts instantly to the input change!)*
