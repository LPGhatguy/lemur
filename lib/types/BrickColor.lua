local assign = import("../assign")
local typeKey = import("../typeKey")
local Color3 = import("./Color3")
local typeof = import("../functions/typeof")

-- Source: https://developer.roblox.com/articles/BrickColor-Codes
-- Palette values taken from Roblox Studio
local VALUES = {
    {number = 1, name = 'White', r = 242, g = 243, b = 243, paletteValue = 87},
    {number = 2, name = 'Grey', r = 161, g = 165, b = 162, paletteValue = nil},
    {number = 3, name = 'Light yellow', r = 249, g = 233, b = 153, paletteValue = nil},
    {number = 5, name = 'Brick yellow', r = 215, g = 197, b = 154, paletteValue = 109},
    {number = 6, name = 'Light green (Mint)', r = 194, g = 218, b = 184, paletteValue = nil},
    {number = 9, name = 'Light reddish violet', r = 232, g = 186, b = 200, paletteValue = 88},
    {number = 11, name = 'Pastel Blue', r = 128, g = 187, b = 219, paletteValue = 51},
    {number = 12, name = 'Light orange brown', r = 203, g = 132, b = 66, paletteValue = nil},
    {number = 18, name = 'Nougat', r = 204, g = 142, b = 105, paletteValue = 110},
    {number = 21, name = 'Bright red', r = 196, g = 40, b = 28, paletteValue = 68},
    {number = 22, name = 'Med. reddish violet', r = 196, g = 112, b = 160, paletteValue = nil},
    {number = 23, name = 'Bright blue', r = 13, g = 105, b = 172, paletteValue = 21},
    {number = 24, name = 'Bright yellow', r = 245, g = 205, b = 48, paletteValue = 71},
    {number = 25, name = 'Earth orange', r = 98, g = 71, b = 50, paletteValue = nil},
    {number = 26, name = 'Black', r = 27, g = 42, b = 53, paletteValue = 3},
    {number = 27, name = 'Dark grey', r = 109, g = 110, b = 108, paletteValue = nil},
    {number = 28, name = 'Dark green', r = 40, g = 127, b = 71, paletteValue = 8},
    {number = 29, name = 'Medium green', r = 161, g = 196, b = 140, paletteValue = 59},
    {number = 36, name = 'Lig. Yellowich orange', r = 243, g = 207, b = 155, paletteValue = nil},
    {number = 37, name = 'Bright green', r = 75, g = 151, b = 75, paletteValue = 25},
    {number = 38, name = 'Dark orange', r = 160, g = 95, b = 53, paletteValue = 119},
    {number = 39, name = 'Light bluish violet', r = 193, g = 202, b = 222, paletteValue = nil},
    {number = 40, name = 'Transparent', r = 236, g = 236, b = 236, paletteValue = nil},
    {number = 41, name = 'Tr. Red', r = 205, g = 84, b = 75, paletteValue = nil},
    {number = 42, name = 'Tr. Lg blue', r = 193, g = 223, b = 240, paletteValue = nil},
    {number = 43, name = 'Tr. Blue', r = 123, g = 182, b = 232, paletteValue = nil},
    {number = 44, name = 'Tr. Yellow', r = 247, g = 241, b = 141, paletteValue = nil},
    {number = 45, name = 'Light blue', r = 180, g = 210, b = 228, paletteValue = 63},
    {number = 47, name = 'Tr. Flu. Reddish orange', r = 217, g = 133, b = 108, paletteValue = nil},
    {number = 48, name = 'Tr. Green', r = 132, g = 182, b = 141, paletteValue = nil},
    {number = 49, name = 'Tr. Flu. Green', r = 248, g = 241, b = 132, paletteValue = nil},
    {number = 50, name = 'Phosph. White', r = 236, g = 232, b = 222, paletteValue = nil},
    {number = 100, name = 'Light red', r = 238, g = 196, b = 182, paletteValue = nil},
    {number = 101, name = 'Medium red', r = 218, g = 134, b = 122, paletteValue = 101},
    {number = 102, name = 'Medium blue', r = 110, g = 153, b = 202, paletteValue = 20},
    {number = 103, name = 'Light grey', r = 199, g = 193, b = 183, paletteValue = nil},
    {number = 104, name = 'Bright violet', r = 107, g = 50, b = 124, paletteValue = 44},
    {number = 105, name = 'Br. yellowish orange', r = 226, g = 155, b = 64, paletteValue = 94},
    {number = 106, name = 'Bright orange', r = 218, g = 133, b = 65, paletteValue = 83},
    {number = 107, name = 'Bright bluish green', r = 0, g = 143, b = 156, paletteValue = 2},
    {number = 108, name = 'Earth yellow', r = 104, g = 92, b = 67, paletteValue = nil},
    {number = 110, name = 'Bright bluish violet', r = 67, g = 84, b = 147, paletteValue = nil},
    {number = 111, name = 'Tr. Brown', r = 191, g = 183, b = 177, paletteValue = nil},
    {number = 112, name = 'Medium bluish violet', r = 104, g = 116, b = 172, paletteValue = nil},
    {number = 113, name = 'Tr. Medi. reddish violet', r = 229, g = 173, b = 200, paletteValue = nil},
    {number = 115, name = 'Med. yellowish green', r = 199, g = 210, b = 60, paletteValue = nil},
    {number = 116, name = 'Med. bluish green', r = 85, g = 165, b = 175, paletteValue = nil},
    {number = 118, name = 'Light bluish green', r = 183, g = 215, b = 213, paletteValue = nil},
    {number = 119, name = 'Br. yellowish green', r = 164, g = 189, b = 71, paletteValue = 46},
    {number = 120, name = 'Lig. yellowish green', r = 217, g = 228, b = 167, paletteValue = nil},
    {number = 121, name = 'Med. yellowish orange', r = 231, g = 172, b = 88, paletteValue = nil},
    {number = 123, name = 'Br. reddish orange', r = 211, g = 111, b = 76, paletteValue = nil},
    {number = 124, name = 'Bright reddish violet', r = 146, g = 57, b = 120, paletteValue = nil},
    {number = 125, name = 'Light orange', r = 234, g = 184, b = 146, paletteValue = 100},
    {number = 126, name = 'Tr. Bright bluish violet', r = 165, g = 165, b = 203, paletteValue = nil},
    {number = 127, name = 'Gold', r = 220, g = 188, b = 129, paletteValue = nil},
    {number = 128, name = 'Dark nougat', r = 174, g = 122, b = 89, paletteValue = nil},
    {number = 131, name = 'Silver', r = 156, g = 163, b = 168, paletteValue = nil},
    {number = 133, name = 'Neon orange', r = 213, g = 115, b = 61, paletteValue = 82},
    {number = 134, name = 'Neon green', r = 216, g = 221, b = 86, paletteValue = nil},
    {number = 135, name = 'Sand blue', r = 116, g = 134, b = 157, paletteValue = 19},
    {number = 136, name = 'Sand violet', r = 135, g = 124, b = 144, paletteValue = nil},
    {number = 137, name = 'Medium orange', r = 224, g = 152, b = 100, paletteValue = nil},
    {number = 138, name = 'Sand yellow', r = 149, g = 138, b = 115, paletteValue = nil},
    {number = 140, name = 'Earth blue', r = 32, g = 58, b = 86, paletteValue = nil},
    {number = 141, name = 'Earth green', r = 39, g = 70, b = 45, paletteValue = 0},
    {number = 143, name = 'Tr. Flu. Blue', r = 207, g = 226, b = 247, paletteValue = nil},
    {number = 145, name = 'Sand blue metallic', r = 121, g = 136, b = 161, paletteValue = nil},
    {number = 146, name = 'Sand violet metallic', r = 149, g = 142, b = 163, paletteValue = nil},
    {number = 147, name = 'Sand yellow metallic', r = 147, g = 135, b = 103, paletteValue = nil},
    {number = 148, name = 'Dark grey metallic', r = 87, g = 88, b = 87, paletteValue = nil},
    {number = 149, name = 'Black metallic', r = 22, g = 29, b = 50, paletteValue = nil},
    {number = 150, name = 'Light grey metallic', r = 171, g = 173, b = 172, paletteValue = nil},
    {number = 151, name = 'Sand green', r = 120, g = 144, b = 130, paletteValue = 34},
    {number = 153, name = 'Sand red', r = 149, g = 121, b = 119, paletteValue = 114},
    {number = 154, name = 'Dark red', r = 123, g = 46, b = 47, paletteValue = nil},
    {number = 157, name = 'Tr. Flu. Yellow', r = 255, g = 246, b = 123, paletteValue = nil},
    {number = 158, name = 'Tr. Flu. Red', r = 225, g = 164, b = 194, paletteValue = nil},
    {number = 168, name = 'Gun metallic', r = 117, g = 108, b = 98, paletteValue = nil},
    {number = 176, name = 'Red flip/flop', r = 151, g = 105, b = 91, paletteValue = nil},
    {number = 178, name = 'Yellow flip/flop', r = 180, g = 132, b = 85, paletteValue = nil},
    {number = 179, name = 'Silver flip/flop', r = 137, g = 135, b = 136, paletteValue = nil},
    {number = 180, name = 'Curry', r = 215, g = 169, b = 75, paletteValue = nil},
    {number = 190, name = 'Fire Yellow', r = 249, g = 214, b = 46, paletteValue = nil},
    {number = 191, name = 'Flame yellowish orange', r = 232, g = 171, b = 45, paletteValue = nil},
    {number = 192, name = 'Reddish brown', r = 105, g = 64, b = 40, paletteValue = 103},
    {number = 193, name = 'Flame reddish orange', r = 207, g = 96, b = 36, paletteValue = nil},
    {number = 194, name = 'Medium stone grey', r = 163, g = 162, b = 165, paletteValue = 123},
    {number = 195, name = 'Royal blue', r = 70, g = 103, b = 164, paletteValue = nil},
    {number = 196, name = 'Dark Royal blue', r = 35, g = 71, b = 139, paletteValue = nil},
    {number = 198, name = 'Bright reddish lilac', r = 142, g = 66, b = 133, paletteValue = nil},
    {number = 199, name = 'Dark stone grey', r = 99, g = 95, b = 98, paletteValue = 122},
    {number = 200, name = 'Lemon metalic', r = 130, g = 138, b = 93, paletteValue = nil},
    {number = 208, name = 'Light stone grey', r = 229, g = 228, b = 223, paletteValue = 62},
    {number = 209, name = 'Dark Curry', r = 176, g = 142, b = 68, paletteValue = nil},
    {number = 210, name = 'Faded green', r = 112, g = 149, b = 120, paletteValue = nil},
    {number = 211, name = 'Turquoise', r = 121, g = 181, b = 181, paletteValue = nil},
    {number = 212, name = 'Light Royal blue', r = 159, g = 195, b = 233, paletteValue = nil},
    {number = 213, name = 'Medium Royal blue', r = 108, g = 129, b = 183, paletteValue = nil},
    {number = 216, name = 'Rust', r = 144, g = 76, b = 42, paletteValue = nil},
    {number = 217, name = 'Brown', r = 124, g = 92, b = 70, paletteValue = 111},
    {number = 218, name = 'Reddish lilac', r = 150, g = 112, b = 159, paletteValue = nil},
    {number = 219, name = 'Lilac', r = 107, g = 98, b = 155, paletteValue = nil},
    {number = 220, name = 'Light lilac', r = 167, g = 169, b = 206, paletteValue = nil},
    {number = 221, name = 'Bright purple', r = 205, g = 98, b = 152, paletteValue = nil},
    {number = 222, name = 'Light purple', r = 228, g = 173, b = 200, paletteValue = nil},
    {number = 223, name = 'Light pink', r = 220, g = 144, b = 149, paletteValue = nil},
    {number = 224, name = 'Light brick yellow', r = 240, g = 213, b = 160, paletteValue = nil},
    {number = 225, name = 'Warm yellowish orange', r = 235, g = 184, b = 127, paletteValue = nil},
    {number = 226, name = 'Cool yellow', r = 253, g = 234, b = 141, paletteValue = 73},
    {number = 232, name = 'Dove blue', r = 125, g = 187, b = 221, paletteValue = nil},
    {number = 268, name = 'Medium lilac', r = 52, g = 43, b = 117, paletteValue = nil},
    {number = 301, name = 'Slime green', r = 80, g = 109, b = 84, paletteValue = 1},
    {number = 302, name = 'Smoky grey', r = 91, g = 93, b = 105, paletteValue = 10},
    {number = 303, name = 'Dark blue', r = 0, g = 16, b = 176, paletteValue = 5},
    {number = 304, name = 'Parsley green', r = 44, g = 101, b = 29, paletteValue = 7},
    {number = 305, name = 'Steel blue', r = 82, g = 124, b = 174, paletteValue = 11},
    {number = 306, name = 'Storm blue', r = 51, g = 88, b = 130, paletteValue = 12},
    {number = 307, name = 'Lapis', r = 16, g = 42, b = 220, paletteValue = 13},
    {number = 308, name = 'Dark indigo', r = 61, g = 21, b = 133, paletteValue = 14},
    {number = 309, name = 'Sea green', r = 52, g = 142, b = 64, paletteValue = 16},
    {number = 310, name = 'Shamrock', r = 91, g = 154, b = 76, paletteValue = 17},
    {number = 311, name = 'Fossil', r = 159, g = 161, b = 172, paletteValue = 29},
    {number = 312, name = 'Mulberry', r = 89, g = 34, b = 89, paletteValue = 23},
    {number = 313, name = 'Forest green', r = 31, g = 128, b = 29, paletteValue = 24},
    {number = 314, name = 'Cadet blue', r = 159, g = 173, b = 192, paletteValue = 39},
    {number = 315, name = 'Electric blue', r = 9, g = 137, b = 207, paletteValue = 30},
    {number = 316, name = 'Eggplant', r = 123, g = 0, b = 123, paletteValue = 33},
    {number = 317, name = 'Moss', r = 124, g = 156, b = 107, paletteValue = 35},
    {number = 318, name = 'Artichoke', r = 138, g = 171, b = 133, paletteValue = 36},
    {number = 319, name = 'Sage green', r = 185, g = 196, b = 177, paletteValue = 37},
    {number = 320, name = 'Ghost grey', r = 202, g = 203, b = 209, paletteValue = 50},
    {number = 321, name = 'Lilac', r = 167, g = 94, b = 155, paletteValue = 42},
    {number = 322, name = 'Plum', r = 123, g = 47, b = 123, paletteValue = 43},
    {number = 323, name = 'Olivine', r = 148, g = 190, b = 129, paletteValue = 47},
    {number = 324, name = 'Laurel green', r = 168, g = 189, b = 153, paletteValue = 48},
    {number = 325, name = 'Quill grey', r = 223, g = 223, b = 222, paletteValue = 49},
    {number = 327, name = 'Crimson', r = 151, g = 0, b = 0, paletteValue = 56},
    {number = 328, name = 'Mint', r = 177, g = 229, b = 166, paletteValue = 60},
    {number = 329, name = 'Baby blue', r = 152, g = 194, b = 219, paletteValue = 64},
    {number = 330, name = 'Carnation pink', r = 255, g = 152, b = 220, paletteValue = 65},
    {number = 331, name = 'Persimmon', r = 255, g = 89, b = 89, paletteValue = 66},
    {number = 332, name = 'Maroon', r = 117, g = 0, b = 0, paletteValue = 69},
    {number = 333, name = 'Gold', r = 239, g = 184, b = 56, paletteValue = 70},
    {number = 334, name = 'Daisy orange', r = 248, g = 217, b = 109, paletteValue = 72},
    {number = 335, name = 'Pearl', r = 231, g = 231, b = 236, paletteValue = 75},
    {number = 336, name = 'Fog', r = 199, g = 212, b = 228, paletteValue = 76},
    {number = 337, name = 'Salmon', r = 255, g = 148, b = 148, paletteValue = 90},
    {number = 338, name = 'Terra Cotta', r = 190, g = 104, b = 98, paletteValue = 79},
    {number = 339, name = 'Cocoa', r = 86, g = 36, b = 36, paletteValue = 81},
    {number = 340, name = 'Wheat', r = 241, g = 231, b = 199, paletteValue = 84},
    {number = 341, name = 'Buttermilk', r = 254, g = 243, b = 187, paletteValue = 85},
    {number = 342, name = 'Mauve', r = 224, g = 178, b = 208, paletteValue = 77},
    {number = 343, name = 'Sunrise', r = 212, g = 144, b = 189, paletteValue = 78},
    {number = 344, name = 'Tawny', r = 150, g = 85, b = 85, paletteValue = 91},
    {number = 345, name = 'Rust', r = 143, g = 76, b = 42, paletteValue = 92},
    {number = 346, name = 'Cashmere', r = 211, g = 190, b = 150, paletteValue = 95},
    {number = 347, name = 'Khaki', r = 226, g = 220, b = 188, paletteValue = 96},
    {number = 348, name = 'Lily white', r = 237, g = 234, b = 234, paletteValue = 97},
    {number = 349, name = 'Seashell', r = 233, g = 218, b = 218, paletteValue = 98},
    {number = 350, name = 'Burgundy', r = 136, g = 62, b = 62, paletteValue = 102},
    {number = 351, name = 'Cork', r = 188, g = 155, b = 93, paletteValue = 104},
    {number = 352, name = 'Burlap', r = 199, g = 172, b = 120, paletteValue = 105},
    {number = 353, name = 'Beige', r = 202, g = 191, b = 163, paletteValue = 106},
    {number = 354, name = 'Oyster', r = 187, g = 179, b = 178, paletteValue = 107},
    {number = 355, name = 'Pine Cone', r = 108, g = 88, b = 75, paletteValue = 112},
    {number = 356, name = 'Fawn brown', r = 160, g = 132, b = 79, paletteValue = 113},
    {number = 357, name = 'Hurricane grey', r = 149, g = 137, b = 136, paletteValue = 115},
    {number = 358, name = 'Cloudy grey', r = 171, g = 168, b = 158, paletteValue = 116},
    {number = 359, name = 'Linen', r = 175, g = 148, b = 131, paletteValue = 117},
    {number = 360, name = 'Copper', r = 150, g = 103, b = 102, paletteValue = 118},
    {number = 361, name = 'Dirt brown', r = 86, g = 66, b = 54, paletteValue = 120},
    {number = 362, name = 'Bronze', r = 126, g = 104, b = 63, paletteValue = 121},
    {number = 363, name = 'Flint', r = 105, g = 102, b = 92, paletteValue = 124},
    {number = 364, name = 'Dark taupe', r = 90, g = 76, b = 66, paletteValue = 125},
    {number = 365, name = 'Burnt Sienna', r = 106, g = 57, b = 9, paletteValue = 126},
    {number = 1001, name = 'Institutional white', r = 248, g = 248, b = 248, paletteValue = 86},
    {number = 1002, name = 'Mid gray', r = 205, g = 205, b = 205, paletteValue = 108},
    {number = 1003, name = 'Really black', r = 17, g = 17, b = 17, paletteValue = 127},
    {number = 1004, name = 'Really red', r = 255, g = 0, b = 0, paletteValue = 67},
    {number = 1005, name = 'Deep orange', r = 255, g = 176, b = 0, paletteValue = 57},
    {number = 1006, name = 'Alder', r = 180, g = 128, b = 255, paletteValue = 41},
    {number = 1007, name = 'Dusty Rose', r = 163, g = 75, b = 75, paletteValue = 80},
    {number = 1008, name = 'Olive', r = 193, g = 190, b = 66, paletteValue = 45},
    {number = 1009, name = 'New Yeller', r = 255, g = 255, b = 0, paletteValue = 58},
    {number = 1010, name = 'Really blue', r = 0, g = 0, b = 255, paletteValue = 22},
    {number = 1011, name = 'Navy blue', r = 0, g = 32, b = 96, paletteValue = 6},
    {number = 1012, name = 'Deep blue', r = 33, g = 84, b = 185, paletteValue = 4},
    {number = 1013, name = 'Cyan', r = 4, g = 175, b = 236, paletteValue = 40},
    {number = 1014, name = 'CGA brown', r = 170, g = 85, b = 0, paletteValue = 93},
    {number = 1015, name = 'Magenta', r = 170, g = 0, b = 170, paletteValue = 55},
    {number = 1016, name = 'Pink', r = 255, g = 102, b = 204, paletteValue = 53},
    {number = 1017, name = 'Deep orange', r = 255, g = 175, b = 0, paletteValue = nil},
    {number = 1018, name = 'Teal', r = 18, g = 238, b = 212, paletteValue = 9},
    {number = 1019, name = 'Toothpaste', r = 0, g = 255, b = 255, paletteValue = 18},
    {number = 1020, name = 'Lime green', r = 0, g = 255, b = 0, paletteValue = 27},
    {number = 1021, name = 'Camo', r = 58, g = 125, b = 21, paletteValue = 15},
    {number = 1022, name = 'Grime', r = 127, g = 142, b = 100, paletteValue = 26},
    {number = 1023, name = 'Lavender', r = 140, g = 91, b = 159, paletteValue = 31},
    {number = 1024, name = 'Pastel light blue', r = 175, g = 221, b = 255, paletteValue = 38},
    {number = 1025, name = 'Pastel orange', r = 255, g = 201, b = 201, paletteValue = 89},
    {number = 1026, name = 'Pastel violet', r = 177, g = 167, b = 255, paletteValue = 52},
    {number = 1027, name = 'Pastel blue-green', r = 159, g = 243, b = 233, paletteValue = 28},
    {number = 1028, name = 'Pastel green', r = 204, g = 255, b = 204, paletteValue = 61},
    {number = 1029, name = 'Pastel yellow', r = 255, g = 255, b = 204, paletteValue = 74},
    {number = 1030, name = 'Pastel brown', r = 255, g = 204, b = 153, paletteValue = 99},
    {number = 1031, name = 'Royal purple', r = 98, g = 37, b = 209, paletteValue = 32},
    {number = 1032, name = 'Hot pink', r = 255, g = 0, b = 191, paletteValue = 54}
}

local BrickColor = {}

setmetatable(BrickColor, {
	__tostring = function()
		return "BrickColor"
	end,
})

local prototype = {}

local metatable = {}
metatable[typeKey] = "BrickColor"

function metatable:__index(key)
	local internal = getmetatable(self).internal

	if internal[key] ~= nil then
		return internal[key]
	end

	if prototype[key] ~= nil then
		return prototype[key]
	end

	error(string.format("%s is not a valid member of BrickColor", tostring(key)), 2)
end

function metatable:__eq(other)
	return self.Number == other.Number
end

local function getColorInfoFromName(name)
    for i = 1, #VALUES do
        local colorInfo = VALUES[i]
        if colorInfo.name == name then
            return colorInfo
        end
    end
    return getColorInfoFromName("Medium stone grey")
end

local function getColorInfoFromNumber(number)
    for i = 1, #VALUES do
        local colorInfo = VALUES[i]
        if colorInfo.number == number then
            return colorInfo
        end
    end
    return getColorInfoFromName("Medium stone grey")
end

local function getBestColorInfoFromRGB(r, g, b)
    r = r and r * 255 or 0
    g = g and g * 255 or 0
    b = b and b * 255 or 0
    local colorInfoChosen
    local difference = math.huge
    for i = 1, #VALUES do
        local colorInfo = VALUES[i]
        local diff = math.abs(r - colorInfo.r) + math.abs(g - colorInfo.g) + math.abs(b - colorInfo.b)
        if diff < difference then
            if diff == 0 then
                return colorInfo
            end
            colorInfoChosen = colorInfo
            difference = diff
        end
    end
    return colorInfoChosen
end

local function getBestColorInfoFromColor3(color3)
    local r, g, b = color3.r, color3.g, color3.b
    return getBestColorInfoFromRGB(r, g, b)
end

local function getColorInfoFromPaletteValue(paletteValue)
    for i = 1, #VALUES do
        local colorInfo = VALUES[i]
        if colorInfo.paletteValue == paletteValue then
            return colorInfo
        end
    end
end

local function buildFromColorInfo(colorInfo)
    local r, g, b = colorInfo.r, colorInfo.g, colorInfo.b

	local internalInstance = {
        Number = colorInfo.number,
        Name = colorInfo.name,
        Color = Color3.fromRGB(r, g, b),
        r = r,
        g = g,
        b = b
	}

	local instance = newproxy(true)

	assign(getmetatable(instance), metatable)
	getmetatable(instance).internal = internalInstance

	return instance
end

function BrickColor.new(...)
    local numArgs = select("#", ...)

    local colorInfo
    if numArgs >= 2 then
        colorInfo = getBestColorInfoFromRGB(...)
    elseif numArgs == 1 then
        local argType = typeof(...)
        if argType == "string" then
            colorInfo = getColorInfoFromName(...)
        elseif argType == "Color3" then
            colorInfo = getBestColorInfoFromColor3(...)
        elseif argType == "number" then
            colorInfo = getColorInfoFromNumber(...)
        else
            error(string.format("Bad argument #1 to 'new' (Color3 expected got %s)", argType))
        end
    elseif numArgs == 0 then
        colorInfo = getColorInfoFromName("Really black")
    end

    return buildFromColorInfo(colorInfo)
end

function BrickColor.palette(paletteValue)
    if not paletteValue then
        error("Argument 1 missing or nil")
    end
    local argType = typeof(paletteValue)
    if argType ~= "number" then
        error(string.format("Unable to cast %s to int", argType))
    end
    paletteValue = math.floor(paletteValue + 0.5)
    if paletteValue < 0 or paletteValue > 127 then
        error(string.format("palette index out of bounds (%d)"), paletteValue)
    end
    local colorInfo = getColorInfoFromPaletteValue(paletteValue)
    return buildFromColorInfo(colorInfo)
end

function BrickColor.random()
    local colorInfo = VALUES[math.random(1, #VALUES)]
    return buildFromColorInfo(colorInfo)
end

function BrickColor.White()
    local colorInfo = getColorInfoFromName("White")
    return buildFromColorInfo(colorInfo)
end

function BrickColor.Gray()
    local colorInfo = getColorInfoFromName("Medium stone grey")
    return buildFromColorInfo(colorInfo)
end

function BrickColor.DarkGray()
    local colorInfo = getColorInfoFromName("Dark stone grey")
    return buildFromColorInfo(colorInfo)
end

function BrickColor.Black()
    local colorInfo = getColorInfoFromName("Black")
    return buildFromColorInfo(colorInfo)
end

function BrickColor.Red()
    local colorInfo = getColorInfoFromName("Bright red")
    return buildFromColorInfo(colorInfo)
end

function BrickColor.Yellow()
    local colorInfo = getColorInfoFromName("Bright yellow")
    return buildFromColorInfo(colorInfo)
end

function BrickColor.Green()
    local colorInfo = getColorInfoFromName("Dark green")
    return buildFromColorInfo(colorInfo)
end

function BrickColor.Blue()
    local colorInfo = getColorInfoFromName("Bright blue")
    return buildFromColorInfo(colorInfo)
end

return BrickColor