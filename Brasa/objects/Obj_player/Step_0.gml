// Pegando a direção
inputX = keyboard_check(input.right)-keyboard_check(input.left) 

// Movimentação e "deslize"
if inputX != 0{
	xSpd = movSpeed * inputX
}
else{
xSpd = lerp(xSpd,0,0.55)
}

// Colisão
if place_meeting(x + xSpd, y, obj_colisor){
    while (!place_meeting(x + sign(xSpd), y, obj_colisor)){
        x += sign(xSpd)
    }
    xSpd = 0
}
x += xSpd

// Pulo
if keyboard_check_pressed(ord("W")) and coyoteTime > 0{
    ySpd = jumpSpeed
    coyoteTime = 0
}

// Resetando o coyote time
if place_meeting(x, y+1, obj_colisor){
        coyoteTime = 10
}

// Efeito da gravidade
else{
    ySpd += gravForce
	coyoteTime--
}
	
// Controle de pulo
if keyboard_check_released(ord("W")) and ySpd < 0{
	ySpd *= 0.4
}


// Colisão
if place_meeting(x, y+ySpd, obj_colisor){
    while (!place_meeting(x, y + sign(ySpd), obj_colisor)){
        y += sign(ySpd)
    }
    ySpd = 0
}

// Limitando a velocidade da queda
if ySpd > maxFallSpeed{
	ySpd = maxFallSpeed
		
}

y += ySpd