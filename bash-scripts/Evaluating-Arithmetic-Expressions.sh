#!/bin/bash
#Write a script that evaluates and displays the following arithmetic operations:
#Add two numbers
#Add two numbers and multiply by a third, do not group anything 
#Add two numbers, grouped (changing order of precedence) and multiply by a third
#Keep in mind special characters and/or escape characters as needed.

expr 2 + 3
expr 2 + 3 \* 4
expr \( 2 \+ 3 \) \* 4
