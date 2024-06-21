class_name Player
extends CharacterBody3D

enum anim_cond_lists {attack, fall, ground, jump,}
const ANIM_COND := {
	anim_cond_lists.attack : "parameters/conditions/attack",
	anim_cond_lists.fall : "parameters/conditions/fall",
	anim_cond_lists.ground : "parameters/conditions/ground",
	anim_cond_lists.jump : "parameters/conditions/jump"
}

const attack_combo :={
	"attack01" : "1H_Attack_Slice_Diagonal",
	"attack02" : "1H_Attack_Horizontal",
	"attack03" : "1H_Attack_Stab",
	"attack04" : "1H_Attack_Chop"
}
const IWR := "parameters/IWR/blend_position"

@export var speed := 5.0
@export var acceleration := 4.0
@export var jump_impulse := 25.0
@export var mouse_sensitivity := 0.015
@export var rotation_speed = 12.0

@onready var spring_arm :SpringArm3D = $SpringArm3D
@onready var model :Node3D = $Rig
@onready var anim_tree :AnimationTree = $AnimationTree
@onready var anim_state :AnimationNodeStateMachinePlayback = anim_tree.get("parameters/playback")
@onready var timer :Timer = $Timer

#func _ready() -> void:
	#pass
