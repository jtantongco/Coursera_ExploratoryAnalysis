#where the plot will display - could be window pdf jpeg svg etc.
#screen device(the window) is most common
# in windows - windows()
# in mac - quartz
# in unix/linux - xll() or x11()? I think its x11()
# Note ?Devices for details

#if you wanna save - file device

#Creating a plot:
#1. plotting fcn
#2. plot appears
#3. annotate
#4. :)
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser Data")

#1. Launch a graphics device
#2. Call a plotting function
#3. Annotate plot if necessary
#4. Explicitly close graphics device with dev.off [*Highly important*]

pdf(file = "myplot.pdf") # create pdf file device (and pdf file)
with(faithful, plot(eruptions,waiting))
title(main = "Old Faithful Geyser Data")
dev.off() #close pdf file device

# for graphic devices - two choices
# vector format and bitmap format

# vector formats are good for line graphics
# pdf [works on all platforms], svg[good for web based and animation], 
# win.metafile (only on windows), postscript

# Bitmap format
# png [lossless compression], jpeg [lossy compression], 
# tiff[lossless], bmp

#can open multiple graphic devices, but plot to only one device at a time
dev.cur() #returns the currently acive graphics device
#returns integer that is >= 2
deviceID <- 2 #some number
dev.set(deviceID) #change to a chosen graphics device

#What about moving plots from device to device
#dev.copy / dev.copy2pdf - note not an exact operation - use with care

library(datasets)
with(faithful, plot(eruptions,waiting))
title(main = "Old Faithful Geyser Data")
dev.copy(png, file="geyserplot.png") #copies a screenplot into a png
dev.off() #important

