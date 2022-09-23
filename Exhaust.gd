extends Line2D


# export var length = 40

export var length = 50
onready var parent = get_parent()
onready var hitbox = $Hitbox

var segments = []
var shorten = 0 #no idea what this does

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	clear_points()

func _physics_process(delta):
	add_point(parent.global_position)
	if points.size() > length:
		remove_point(0)
	update_collision_shape()



# thanks king: https://godotengine.org/qa/67407/adding-collision-detection-to-line2d-collisionpolygon2d
func update_collision_shape():
	var n = points.size()
	if n < 2:
		# waiting for a 2nd point to create a segment
		return

	# replace all segments (for now, TODO: optimize the update)
	segments.clear()
	for i in range(n-1):
		segments.append(create_segment(points[i], points[i+1]))

	# I may not even need this
	# reduce_last_segment()

	# re-add all segments: delete old childs and recreate all
	clear_all_shape(true)
	for s in segments:
			hitbox.add_child(s)

func clear_all_shape(keep_segments = false):
	for c in hitbox.get_children():
		c.queue_free()
	if not keep_segments:
		segments.clear()

func create_segment(p1 : Vector2, p2 : Vector2, shorten : int = 0) -> CollisionShape2D:
	var collision = CollisionShape2D.new()
	collision.shape = SegmentShape2D.new()
	collision.shape.a = p1
	collision.shape.b = p2

	if shorten > 0:
		reduce_segment(collision, shorten)
	return collision

func reduce_segment(seg : CollisionShape2D, shorten : int):
	var v = (seg.shape.b  - seg.shape.a).normalized()
	# we calculated the length of the segment, reducing at max of its length
	var d = seg.shape.a.distance_to(seg.shape.b)
	var delta = min(d, shorten)
	var b = seg.shape.b
	b -= v * delta
	seg.shape.b = b

func reduce_last_segment(shorten : int = -1) -> int:
	if points.size() < 2 or segments.size() == 0:
		return 0

	if shorten < 0:
		# default value
		pass
		# TODO: figure out what last_segement_reduction represents
		# shorten = last_segment_reduction

	# r count the number of segment modified
	var r = 0
	# last point is the player, to avoid collision we shorten
	# this last segment, or even the previous one on corner
	var d = points[-2].distance_to(points[-1])
	if d < shorten:
		# skip last segment too short
		segments.pop_back()
		r += 1

		# we also reduce previous segment, as are still to near
		if segments.size() > 0:
			reduce_segment(segments[-1], shorten - d)
			r += 1
	else:
		# we shorten the last segment only
		reduce_segment(segments[-1], shorten)
		r += 1
	return r
