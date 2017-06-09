The safer alternative to Smart skin : The design and fabrication of piezoresistive trackpad to simulate “touch” for bionic limbs and robot parts
 
Aman Adhav                                                                                                                       
Bay Area Science Fair, 2017
 
 
Currently, Smart skin technologies are primarily being used as sensors and to control devices. However, using Smart skin technology is problematic: the metals and chemicals used in Smart skins can enter the bloodstream, potentially leading to major health problems such as metal poisoning, Alzheimer's disease, and cancer. This project presents the design and fabrication of a piezoresistive flexible surface for quantifying “touch” on surfaces such as the human skin. The piezoresistive fabric is a transducer that senses touch and pressure. Results show, the signals from the surface can be converted into Euclidean coordinates using a multilateration algorithm. As an illustration of the concept, were initialized and programmed to control radio frequency devices when touched.

Experiment & Process 
 
In order for location tracking to occur, at each end of the piezoelectric fabric a 5V (high) voltage needs to be applied. Location tracking occurs when 3 of the 4 sensels are high while the 4th one is low. However the sensels alternate and switch roles every 1 ms. An example would be [Sensel 1 (low), sensel 2,3,4 (high)], [Sensel 2 (low), sensel 1,3,4 (high)]. What is printed out in the arduino serial monitor is a series of analogread values between 0 - 1023. If values such as 1023 are outputted by the A0 pin, then it is safe to assume the pin is touching one of the 4 corners. This raw data is then further refined by choosing every 10th term at a 5 ms interval. 
 
In order to calculate locations using this data, the serial port of the arduino is synced with a software called Processing 3.0, it uses java 8.0 however has many inbuilt functions that can help create graphs and animation. In Processing the raw data values are scaled to fit inside a (600,600) area by using the map function. Once converted the data is then plotted.
 
Plot 1 : Intersection of circles
This particular plot is effectively used to visualize trilateration and intersection of the circles. In this plot, in order to find the values a special trilateration function is written.  The data from the each sensel is used as the radius for a circle. This function is used to calculate the coordinates of two points based on alternating between sensel 3 and 4. The coordinates are found by calculating finding the sensel which has the smallest value (from raw data indicating the radius). 
 
Plot 2 : X, Y coordinate location 
In order to generate graph of the X, Y coordinate, the values computed from the trilateration algorithm are then converted to data points that needs to be graphed.

For a copy of the entire Documentation, please contact me through [email](amanadhav@gmail.com) or visit [BASEF](http://basef.ca/2017StudentAwardsIndex).

![Screenshot](cake.PNG)


