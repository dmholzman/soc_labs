sdimg.zip is a disk image that is suitable for programming with a RAW image flashing tool.  

This will remove any question about how the image is created, on what OS...etc, as it will be 
an exact, byte-for-byte copy.

This image contains an image of the first 1GB of the card, so it is 1GB.  
First, download the sdimg.zip to the local machine
Second, unzip it to make the full 1GB image file

To burn this image on an SD card, you can use the tool BalenaEtcher (you will need to "run As Administrator") 

Select the unzipped image file as the source file, and make sure to select the proper target (your SD card!) 

After the device has finished flashing, remove it and put it into the Zybo to boot.

If you are worried about what your computer does to the SD cards...etc. don't insert it into your computer again

Doug
