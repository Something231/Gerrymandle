extends Node2D

var x_cursor = load("res://Assets/TempDeselectIcon.png")
var selection_cursor = load("res://Assets/TempSelectIcon.png")
var mode = true

var width = 10
var height = 10
var l = 50
var h = 50
var grid = []

func _draw() -> void:
	for y in range(height):
		var row = []
		for x in range(width):
			var p = 0 if randf() < 0.5 else 1
			row.append(p)
			var colour = Color.REBECCA_PURPLE if p == 1 else Color.CYAN
			var rect = Rect2(l*x+300, h*y+100, l, h)
			draw_rect(rect, colour)
		grid.append(row)
	var rect = Rect2(300, 100, width*l, height*h)
	draw_rect(rect, Color.BLACK, false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(selection_cursor)
	_draw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_select_button_pressed() -> void:
	Input.set_custom_mouse_cursor(selection_cursor)
	mode = true
	pass # Replace with function body.


func _on_deselect_button_pressed() -> void:
	Input.set_custom_mouse_cursor(x_cursor)
	mode = false
	pass # Replace with function body.
