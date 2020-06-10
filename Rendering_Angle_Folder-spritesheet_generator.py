#Parent directory: Contains multiple directories, each named for an angle of rendering, possibly along with more files
#Angle directories: Contain several images, which are to be packed into a sprite sheet in each folder

#The output sprite sheet will have 2 rows:
	# One of all animation frames
	# One of all non-animation frames

#IGNORE ALL THAT THERE IS ONLY 1 ROW ^^
import os, os.path, math, time
from PIL import Image

max_sprites_row 	= 5.0
tile_width 			= 0
tile_height 		= 0
spritesheet_width	= 0
spritesheet_height 	= 0

#An array of the directories that we want to work with, cleaned of everything else in the parent directory
angle_directories = []
angle_directory_names = []
current_angle_directory_contents = []
animation_frame_files = []

frames = []

print("Specify the image title prefix for animation frames:")
animation_frame_prefix = input()

#Default directory to use:
parent_dir = '/Volumes/MISC/Senior Project/Visual Art/3D/Renders/Rig Test/Animation_Rotation_Test_10fps/walk_loop'
	#This one lets you specify it when you run the script but we aren't doin that yet
#print("Specify the directory to work in:")
#parent_dir = input()

#print("Specify the name to include in the title:")
#output_name = input()

parent_dir_contents = os.listdir(parent_dir)
parent_dir_contents.sort()

#Gets all the contents of the parent directory and only adds the folders that have angles as their titles to the angle_directories array
for i in parent_dir_contents:
	try:
		int(i)
		angle_directories.append(parent_dir + '/' + i)
		angle_directory_names.append(i)
	except ValueError:
		print("non-angle file found, skipping...")
		continue



for current_angle_directory in angle_directories:
	print("-------NEW ANGLE-------")
	frames = []
	animation_frame_files = []

	current_angle_directory_contents = os.listdir(current_angle_directory)
	current_angle_directory_contents.sort()

	for current_file in current_angle_directory_contents:
		try:
			with Image.open(current_angle_directory + "/" + current_file) as im:
				frames.append(im.getdata())

				#If the current file's name matches the specified prefix for animation frames, add it to our array of animation frame files
				if(current_file[:(len(animation_frame_prefix))] == animation_frame_prefix):
					animation_frame_files.append(current_file)
				print(current_file)
		except:
			print(current_angle_directory + "/" + current_file + " is not a valid image")
	#print(animation_frame_files)
	tile_width 	= frames[0].size[0]
	tile_height = frames[0].size[1]
	#There will probably be more animation frames than non-animation frames, and we want all of them to be in one row, so:
	spritesheet_width = len(frames) * tile_width
	spritesheet_height = tile_height
	# if(animation_frame_files != []):
	# 	spritesheet_width = len(animation_frame_files) * tile_width
	# 	spritesheet_height = tile_height * 2

	# else:
	# 	spritesheet_width = len(current_angle_directory_contents) * tile_width
	# 	spritesheet_height = tile_height

	# print(spritesheet_width)
	# print(spritesheet_height)
	# print(frames)
	# print(animation_frame_files)

	spritesheet = Image.new("RGBA", (int(spritesheet_width), int(spritesheet_height)))
	spritesheet.save("spritesheet.png", "PNG")

	for current_frame in frames:
		#Setting position on the sprite sheet:
		# if animation_frame_files != []:
		# 	top = tile_height * math.floor((frames.index(current_frame)) / (len(animation_frame_files)))
		# else:
		# 	top = 0

		top 	= 0
		#left 	= tile_width * (frames.index(current_frame) % len(animation_frame_files))
		left 	= tile_width * (frames.index(current_frame))
		bottom 	= top + tile_height
		right 	= left + tile_width

		box = (left, top, right, bottom)
		box = [int(i) for i in box]

		cut_frame = current_frame.crop((0, 0, tile_width, tile_height))

		spritesheet.paste(cut_frame, box)


	#print(parent_dir + "/" + angle_directory_names[angle_directories.index(current_angle_directory)] +"-spritesheet" + ".png")
		#Putting "strip" + the amount of frames formats the file for GMS2 sprite sheet importing
	spritesheet.save(parent_dir + "/" + angle_directory_names[angle_directories.index(current_angle_directory)] +"-spritesheet_" + "strip" +str(len(frames)) + ".png" , "PNG")

