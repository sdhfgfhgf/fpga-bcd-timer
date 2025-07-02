# ⏱️ Accurate FPGA Verilog BCD Counter

This project implements a **4-digit BCD (Binary-Coded Decimal) counter** in Verilog with near-accurate real-time intervals. Developed as part of **APSC 262 – Digital Logic Design** at UBC.

---

## 🔧 Features
- 50 MHz clock-based counter
- Displays digits on `HEX[3:0]` 7-segment displays
- Resets with pushbutton (`KEY[0]`)
- Digit update intervals:
  - `bcd0` → 0.01 seconds
  - `bcd1` → 0.1 seconds
  - `bcd2` → 1 second
  - `bcd3` → 10 seconds

---

## 📁 File List
| File        | Description                            |
|-------------|----------------------------------------|
| `Lab5II.v`  | Main module: 4-digit BCD counter logic |
| `bcd7seg.v` | Converts BCD digits to 7-segment code  |

---

## 🚀 How to Use (on Quartus / FPGA)
1. Create a new Quartus project
2. Add both `Lab5II.v` and `bcd7seg.v`
3. Assign FPGA I/O:
   - `CLOCK_50` → 50 MHz clock input
   - `KEY[0]` → active-low reset
   - `HEX[3:0]` → output displays
   - `LEDG[7:0]` → (optional) debug output

4. Compile and flash to DE1 board

---

## 🧠 Technical Highlights
- Uses a 19-bit counter to approximate a 0.01s timing base
- Clean BCD carry logic cascades across four decimal digits
- Modular design separates core logic from display driver

