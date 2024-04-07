extends Node2D

var array_zombies = [0,0,0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,4,4,5]
var zombies = []
var maps_to_draw = [1,5,7,8]
func draw():
	for i in maps_to_draw:
		var zombie = array_zombies.pick_random()
		zombies = [[i, zombie]]
