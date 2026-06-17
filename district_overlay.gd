extends Node2D

var sgrid: Array
var width: int
var height: int
var l: int
var h: int
var xoffset: int
var yoffset: int
const colour_map = [Color.RED, Color.DARK_ORANGE, Color.OLIVE_DRAB, Color.YELLOW, Color.SLATE_GRAY, Color.LIGHT_CORAL]

func _draw() -> void:
	for y in height:
		for x in width:
			if sgrid[y][x] != 0:
				var r = Rect2(l*x+xoffset, h*y+yoffset, l, h)
				draw_rect(r, colour_map[sgrid[y][x]], false, 10)

func initialise_positions(a, b, c, d, e, f):
	width = a
	height = b
	l = c
	h = d
	xoffset = e
	yoffset = f

func draw_overlay(new_grid):
	sgrid = new_grid
	queue_redraw()
