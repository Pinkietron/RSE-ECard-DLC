# RSE-ECard-DLC
Adding more content to Pokemon Ruby, Sapphire, and Emerald 

# Credits
ImABlisy - Programming most functions

Shao - Programming assistance

# Building

The source folders already contain all of the required bash script files for building

After making any changes:

```make```

```./bins```

In a hex editor remove the header from strip1 (the file should start with 76 70 6B...)
copy from offset 0x51 to the end of the file in strip2 into the end of strip1 and save the file

```./cards```
