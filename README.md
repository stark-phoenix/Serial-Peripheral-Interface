# Serial-Peripheral-Interface
## Objective
1. To understand the SPI communication protocol and its advantages like less latency and more throughput over UART and I2C.
2. To implement the logic using Verilog and therefore, establish the SPI communication between 2 FPGA boards.
3. To do waveform analysis and verify the feasibility of the state machine that we have designed.
4. To verify the full-duplex communication i.e. correct data is transmitted and received.

## Block Diagram in the top-level
## Details about the sub-blocks
<ol>
  <li> <b>Master Block:</b>
<ul>
  <li>This is the device that initiates the process of communication and controls the data transfer.
  <li>The master device generates the clock signal and selects the slave device with which it wants to communicate.
  <li>It typically consists of shift registers for receiving and transmitting data, a clock generator, and a control logic.
</ul>
  <li> <b>Slave Block:</b>
<ul>
<li>This is a device that receives and responds to commands initiated by the master device. 
<li>It listens for the chip select signal from the master and responds with the appropriate data. 
<li>It typically consists of a shift register and control logic for decoding the control signals from the SPI master. The shift register is used to hold the data that is being transmitted or received, while the control logic is responsible for generating the appropriate control signals for the chip select line and the MISO (Master-In-Slave-Out) and MOSI (Master-Out-Slave-In) lines.
<li>This device needs to be synchronized with the master clock signal.
  </ul>
  <li> <b>Wires:</b>
<ul>
  <li> <b> SCLK ( Serial Clock ):</b> Used to synchronize the data transfer between the master and slave devices.
  <li> <b> CS ( Chip select ):</b> Used to select the slave device with which the master wants to communicate.
  <li> <b> MOSI ( Master-out, Slave-in ):</b> Used to transmit data from the master to the slave device.
  <li> <b> MISO ( Master-in, Slave-out ):</b> Used to transmit data from the slave to the master device.
  </ul>
  <li> <b>Shift registers:</b>
<ul>
  <li> These are storage elements that would be storing the received data or the data to be transmitted.
  <li> We would be implementing the 8-bit registers using 8 D flip-flops.
  <li> The registers would be working according to the FIFO rule i.e. the bit that was stored first would be transmitted first.
  </ul>
  </ol>






