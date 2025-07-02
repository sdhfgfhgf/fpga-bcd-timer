⏱️ Accurate FPGA Verilog BCD Counter

This project implements a 4-digit BCD (Binary-Coded Decimal) counter in Verilog with near-accurate real-time intervals. Developed as part of APSC 262 – Digital Logic Design at UBC.

⸻

🔧 Features
- 50 MHz clock-based counter
- Displays digits on HEX[3:0] 7-segment displays
- Resets with pushbutton (KEY[0])
- Digit update intervals:
- bcd0 → ~0.01 seconds
- bcd1 → ~0.1 seconds
- bcd2 → ~1 second
- bcd3 → ~10 seconds

⸻

🖼️ Demo

<img src="Image/HEIF Image.jpeg" alt="DE1 BCD Counter Demo" width="50%" />


The number display shows a BCD counter with four signals that count every 0.01 seconds.
The bit-width of the internal count register is based on:

2^x × 20ns = 0.01s  →  x ≈ 19

Thus, a 19-bit counter is used to generate the base timing signal from a 50 MHz clock.

⸻

📄 File

File	Description
bcd-counter.v	Complete Verilog design with display logic and timing counter


⸻

🚀 How to Use (on Quartus / FPGA)
	1.	Create a new Quartus project.
	2.	Add bcd-counter.v to your project.
	3.	Assign FPGA I/O pins:
	  - CLOCK_50 → 50 MHz system clock
	  - KEY[0] → active-low pushbutton reset
	  - HEX[3:0] → 7-segment display outputs
	  - LEDG[7:0] → (optional) debug counter output
	4.	Compile and flash to your DE1 (or compatible) development board.

⸻

🧠 Technical Highlights
	- 19-bit internal counter generates ~10.5 ms timing pulse
	- BCD digits (bcd0–bcd3) increment with proper cascading logic
	- Includes bcd7seg submodule for real-time 7-segment display encoding
	- Clean, modular design suitable for academic FPGA projects

⸻
