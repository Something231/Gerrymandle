extends Node2D

var x_cursor = load("res://Assets/TempDeselectIcon.png")
var selection_cursor = load("res://Assets/TempSelectIcon.png")
var mode = true

const width = 10
const height = 10
const l = 50
const h = 50

var grid = []

var sgrid = []
var current_selection:int = 0

func _draw() -> void:
	for y in range(height):
		var row = []
		var srow = []
		for x in range(width):
			var p = 0 if randf() < 0.5 else 1
			row.append(p)
			row.append(0)
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
	_draw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('Left_click'):
		var mouse_pos: Vector2 = get_global_mouse_position()
		if (300 < mouse_pos[0]) and (mouse_pos[0]) < (300+width*l) and (100 < mouse_pos[1]) and (mouse_pos[1]) < (100+height*h):
			var cell_x = int(floor((mouse_pos[0]-300) / (l)))
			var cell_y = int(floor((mouse_pos[1]-100) / (h)))
			print(cell_x, cell_y)


func _on_select_button_pressed() -> void:
	Input.set_custom_mouse_cursor(selection_cursor)
	mode = true


func _on_deselect_button_pressed() -> void:
	Input.set_custom_mouse_cursor(x_cursor)
	mode = false
