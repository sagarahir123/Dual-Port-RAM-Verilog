# Dual-Port Synchronous RAM (DPRAM) Design and Verification

### Project Description
Yeh project Verilog HDL ka upyog karke ek **Parameterizable Dual Port RAM** ka implementation hai. Dual Port RAM ki khasiyat yeh hai ki isme do independent ports (Port A aur Port B) hote hain, jo ek hi samay (simultaneously) memory ko read ya write kar sakte hain.

### Hardware Architecture
* **Inputs:** `clk`, `we_a`, `we_b`, `addr_a`, `addr_b`, `din_a`, `din_b`
* **Outputs:** `dout_a`, `dout_b`
* **Memory Array:** `reg [DATA_WIDTH-1:0] mem [(1<<ADDR_WIDTH)-1:0]`

---

### Tools Used 🛠️
* **Simulation & Synthesis:** Xilinx Vivado / ModelSim / Icarus Verilog (Aap jo use kar rahe hain uska naam rakhein)
* **Waveform Viewer:** GTKWave / Vivado Logic Analyzer
* **Language:** Verilog HDL

---

### Project Outcome ✅
1. **Concurrency:** Safalta-purvak demonstrate kiya gaya ki kaise do independent buses ek hi memory array ko bina data loss ke access kar sakti hain.
2. **Resource Optimization:** Parameterized design ki wajah se is RAM ko kisi bhi bit-width (8, 16, 32-bit) ke liye reuse kiya ja sakta hai.
3. **Verification:** Testbench ke zariye simultaneous read aur write collisions ko verify kiya gaya, jisse design ki reliability confirm hui.

---

### Simulation Results (Waveform) 📊
Niche di gayi image simulation waveforms ko dikhati hai jahan Port A aur Port B ek hi samay par data access kar rahe hain:

![Simulation Waveform](./simulation_pic.png) 
*(Note: Apni waveform ki photo ka naam 'simulation_pic.png' rakh kar GitHub pe upload karein taaki woh yahan dikhe)*

---

### Testbench Scenarios Covered
1. **Port A Write:** Address 10 par `0xAA` write karna.
2. **Port B Write & Port A Read:** Port B se address 20 par write karna aur usi samay Port A se read karna.
3. **Simultaneous Read:** Dono ports se ek hi address (Address 10) se data read karna.

---

### Author ✍️
* **Aapka Naam** * GitHub: [github.com/your-username](https://github.com/your-username)
* LinkedIn: [Inka link yahan daalein]
