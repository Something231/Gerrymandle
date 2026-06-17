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
	pass

func initialise_positions():
	pass

func draw_overlay(new_grid):
	sgrid = new_grid
	queue_redraw()
