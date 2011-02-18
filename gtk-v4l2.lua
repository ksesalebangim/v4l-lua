#! /usr/bin/env lua

--[[ 
This example depends on the lgob (a set of bindings of GObject-based libraries, like GTK+ and WebKitGtk, and some others like Cairo, for Lua).
I've installed the 32 bits version of lgob from here: http://downloads.tuxfamily.org/oproj/bin/ubuntu32/
You have the choice to install it from the sources, found at: http://oproj.tuxfamily.org/wiki/doku.php?id=lgob
Enjoy!
]] --



require "v4l"
require('lgob.gdk')
require('lgob.gtk')

--[[ 
function saveimg(img)
 file = io.open("image.ppm", "w+")
 file:write("P3\n".. w .. " " .. h .."\n255\n") 
 for i=1,#img do
    local p = a[i] .. "\n"  
    file:write(p)
  end
  file:close()
end
]] --

camera = #arg

if camera < 1 then
  camera = "/dev/video0"
else
  camera = arg[1]
end

dev = v4l.open(camera)

if dev < 0 then
  print("camera not found")
  os.exit(0)
end

w, h = v4l.widht(), v4l.height()

print(camera .. ": " ..w .. "x" .. h)

<<<<<<< HEAD
-- saveimg(a)

for i=1,3 do -- take 3 pics to get a better image
 a = v4l.getframe()
end

img = "P3\n" .. w .. " " ..  h .. "\n255\n" .. table.concat(a, "\n") -- formats the image to pixbuf format
=======
for i=1,3 do -- take 3 pics to get a better image
   a = v4l.getframe()
end

-- saveimg(a)


dev = v4l.close(dev);

if dev == 0 then
  print("File descriptor closed: " .. dev)
end

img = "P3\n" .. w .. " " ..  h .. "\n255\n" .. table.concat(a, "\n")

-- img = io.open("image.ppm", "r"):read("*a")
-- print(img)


>>>>>>> 40887aa01dafcc080e4e5fcbb0be35e454177e5e
loader = gdk.PixbufLoader.new()
loader:write(img, img:len())
loader:close()
pixbuf = loader:get_pixbuf()
<<<<<<< HEAD
 
window = gtk.Window.new()
hbox = gtk.VBox.new(false, 10)

image = gtk.Image.new_from_pixbuf(pixbuf)
button = gtk.Button.new_with_label("Photo")

hbox:add(image, button)
=======

window  = gtk.Window.new()
hbox = gtk.HBox.new(true, 10)
image = gtk.Image.new_from_pixbuf(pixbuf)
hbox:add(image)
>>>>>>> 40887aa01dafcc080e4e5fcbb0be35e454177e5e
window:add(hbox)

window:set('title', "Camera photo " .. camera .. "  "..  w .. "x" .. h, 'window-position', gtk.WIN_POS_CENTER)
window:connect('delete-event', gtk.main_quit) 
<<<<<<< HEAD
button:connect('clicked', function() print ("button")end )
window:show_all()
img = nil
a = nil
gtk.main()

dev = v4l.close(dev);

if dev == 0 then
  print("File descriptor closed: " .. dev)
end

=======
window:show_all()

gtk.main()
>>>>>>> 40887aa01dafcc080e4e5fcbb0be35e454177e5e
