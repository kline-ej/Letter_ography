# Letter_ography
The letterography project allows a user to write words, sentences, and general hijinx involving basic characters to a monitor screen using the Quartus software. The placement of these characters on a screen is written and stored in a .mif file. The DE1-SoC control system that connects to the software allows the user to scroll through the .mif file screen by screen.

Things to know:
- the resolution of the monitor is 160*120 (making an area of 19200)
- KEY[0] and SW[1] are the manual controls used

These links lead to video demos.
1) https://www.youtube.com/watch?v=3pkp9UuK8h8
This first video shows the controls of the board and how they relate to the monitor. As can be seen, SW[0] is used to switch the screens, and KEY[0] is used to initiate the choice to change the screen.

2) https://www.youtube.com/watch?v=CaQ2dUkoOls
This second video shows the full display of characters that can be used, which is the alphabet in their capital form and basic punctuation marks, such as a period, exclamation point, and a question mark.

FILES
- (fonts.v) - holds design for each character in a 5x5 frame
- (chars_rom.v) - holds the .mif file pt.1
- (key_rising_edge.v) - acts as a debounce for the controls
- (frame_writer.v) - responsible for writing each pixel to the frame
- (proj.v) - connects all of the other .v files, or modules, to provide a final function
- (sceen_chars.v) - sets rules and parameters for the writing to the screen
- (sceen_chars_mem.v) -holds the .mif file pt.2

Credit to Dr. Peter Jamieson (the next three modules were made by this ECE professor)
- These modules were used to access control of the screen in order to write to it.
- (vga_driver.v) 
- (vga_frame.v)
- (vga_frame_driver.v)

With this knowledge, a person can create screen by screen, text only, choose-your-own-adventure game.
