extends Node2D

var x_cursor = load("res://Assets/TempDeselectIcon.png")
var selection_cursor = load("res://Assets/TempSelectIcon.png")
@onready var overlay = get_node("District_Overlay")

var mode: int = 1

const width = 10
const height = 10
const l = 50
const h = 50

var grid = []

var sgrid = []
const district_size_cap = 20 
const number_districts = floor((width*height) / district_size_cap)
var district_sizes = []
var current_selection:int = 0

func _draw() -> void:
	for y in range(height):
		var row = []
		var srow = []
		for x in range(width):
			var p = 0 if randf() < 0.5 else 1
			row.append(p)
			srow.append(0)
			var colour = Color.REBECCA_PURPLE if p == 1 else Color.CYAN
			var rect = Rect2(l*x+300, h*y+100, l, h)
			draw_rect(rect, colour)
		grid.append(row)
		sgrid.append(srow)
	var rect = Rect2(300, 100, width*l, height*h)
	draw_rect(rect, Color.BLACK, false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(selection_cursor)
	district_sizes.resize(number_districts+1)
	district_sizes.fill(0)
	_draw()
	overlay.initialise_positions(width, height, l, h, 300, 100)
	overlay.draw_overlay(sgrid)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('Left_click'):
		var mouse_pos: Vector2 = get_global_mouse_position()
		if (300 < mouse_pos[0]) and (mouse_pos[0]) < (300+width*l) and (100 < mouse_pos[1]) and (mouse_pos[1]) < (100+height*h):
			var cell_x = int(floor((mouse_pos[0]-300) / (l)))
			var cell_y = int(floor((mouse_pos[1]-100) / (h)))
			if mode == 0 and sgrid[cell_y][cell_x] != 0:
				district_sizes[sgrid[cell_y][cell_x]] -= 1
				sgrid[cell_y][cell_x] = 0
				print("erased cell: " + str(cell_x) + str(cell_y))
			elif sgrid[cell_y][cell_x] == 0 and district_sizes[mode] != district_size_cap and mode != 0:
				if district_sizes[mode] == 0 or (cell_x != 0 and sgrid[cell_y][cell_x-1] == mode) or (cell_y != 0 and sgrid[cell_y-1][cell_x] == mode) or (cell_x != (width-1) and sgrid[cell_y][cell_x+1] == mode) or (cell_y != (height-1) and sgrid[cell_y+1][cell_x] == mode):
					sgrid[cell_y][cell_x] = mode
					district_sizes[mode] += 1
					print("converted cell: " + str(cell_x) + str(cell_y) + " to: " + str(mode))
	overlay.draw_overlay(sgrid)


func _on_select_button_pressed() -> void:
	Input.set_custom_mouse_cursor(selection_cursor)


func _on_deselect_button_pressed() -> void:
	Input.set_custom_mouse_cursor(x_cursor)
	mode = 0


func _on_select_button_5_pressed() -> void:
	mode = 5


func _on_select_button_4_pressed() -> void:
	mode = 4


func _on_select_button_3_pressed() -> void:
	mode = 3


func _on_select_button_2_pressed() -> void:
	mode = 2


func _on_select_button_1_pressed() -> void:
	mode = 1
