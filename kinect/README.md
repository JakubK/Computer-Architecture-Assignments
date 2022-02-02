Microsoft Kinect Camera allows to register screen in color and depth. Libraries attached to the camera (Kinect SDK) contain a set of functions providing detection and tracking users on recorded screens - these operations are being realized by operations on RGB-D 

Single RGB-D screen is made of 2 complementary arrays with dimensions equal to screen dimension (for example 640 x 480). First array containt information about colors, second contains D factor (depth). Each element of D array has 16 bits and depicts a single pixel.

Name might be confusing because D factor is made of 2 parts: real depth and information if given pixel is belongs to some user (player index).

Measured depth is equal to distance of point from the camera in milimeters, expressed as 13bit integral number. `Player Index` field has 3 bits for informing if given pixel belong to detected user and which one is it (001 - first, 010 - second ....). Value 000 for given index means that pixel has no owner, and 111 - no measure for this pixel. We assume 640 x 480 pixel resolution (x_max = 640, y_max = 480).

