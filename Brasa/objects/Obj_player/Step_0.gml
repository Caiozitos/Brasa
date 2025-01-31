inputX = keyboard_check(input.right)-keyboard_check(input.left) 
if inputX != 0{
	speed = movSpeed * inputX
}
else{
speed = lerp(speed,0,0.2)
}