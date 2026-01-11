# Dual-Port Synchronous RAM (DPRAM) Design and Verification

### Project Description
This project implements a **Parameterizable Dual-Port RAM** using Verilog HDL. The primary advantage of a Dual-Port RAM is the inclusion of two independent ports (Port A and Port B), which allow simultaneous memory access (read or write) from two different sources. This architecture is essential for shared memory systems, such as video buffers or communication between different clock domains.

### Hardware Architecture
* **Control Signals:** `clk` (System Clock), `we_a` & `we_b` (Write Enables)
* **Address Buses:** `addr_a` & `addr_b` (Independent addressing)
* **Data Interfaces:** `din_a`/`din_b` (Inputs), `dout_a`/`dout_b` (Outputs)
* **Memory Array:** `reg [DATA_WIDTH-1:0] mem [(1<<ADDR_WIDTH)-1:0]`

---

### Tools Used 🛠️
* **Simulation & Synthesis:** Xilinx Vivado / ModelSim / Icarus Verilog
* **Waveform Viewer:** GTKWave / Vivado Logic Analyzer
* **Language:** Verilog HDL

---

### Project Outcome ✅
1. **Concurrency:** Successfully demonstrated how two independent buses can access the same memory array simultaneously without data loss.
2. **Resource Optimization:** Developed a parameterized design, allowing the RAM to be easily scaled for various data widths (8, 16, 32-bit) and depths.
3. **Verification:** Validated simultaneous read operations and write collisions through a comprehensive testbench, ensuring high design reliability.

---

### Simulation Results (Waveform) 📊
The image below illustrates the simulation waveforms where Port A and Port B are accessing data at the same time:

![Simulation Waveform](./simulation_pic.png) 

---

### Testbench Scenarios Covered
1. **Port A Write:** Writing `0xAA` to Address 10 using Port A.
2. **Port B Write & Port A Read:** Writing to Address 20 via Port B while simultaneously reading from Port A.
3. **Simultaneous Read:** Reading from the same memory location (Address 10) through both ports at once.
4. **Collision Check:** Monitoring behavior when both ports attempt to access the same address.

---

### Author ✍️
* **Sagar Katariya** - [GitHub Profile](https://github.com/sagarahir123)
* **LinkedIn:** [Sagar Katariya](https://www.linkedin.com/in/sagar-katariya-803763248/)
