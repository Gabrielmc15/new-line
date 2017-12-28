function menu_load()
	pressed = false

	x_play_button=(width/2) - 100
	y_play_button=(height/2) +100
	play_pressed= false

	x_help_button=(width/2) - 100
	y_help_button=y_play_button + 70
	help_pressed= false

	x_exit_button=(width/2)-100
	y_exit_button=y_help_button + 70
	exit_pressed= false
	total_score = 0
	score = 0
	final_score = 0
	score_update = false
end

function menu_update(dt)
	--[[if love.keyboard.isDown("escape") then
		love.window.close( )
	end--]]
	------------------para somar e subtrair score-----------------------
	if score_update then
		total_score = score + final_score 
		score_update = false
	end
	if fail  then 
		total_score =  total_score - final_score
		score_update = true
	end


	x_mouse, y_mouse = love.mouse.getPosition( )
	if stage == 0 then
		function love.mousereleased(x, y, button)
			if stage == 0 then
				if button == 1 and (checaToqueRectangle(x_mouse,y_mouse, x_play_button, y_play_button, 200, 50) or checaToqueRectangle(x_mouse,y_mouse, x_help_button, y_help_button, 200, 50) or checaToqueRectangle(x_mouse,y_mouse, x_exit_button, y_exit_button, 200, 50) ) then
					pressed = true
					else pressed = false
				end
			end
		end
		--botao play
		if checaToqueRectangle(x_mouse,y_mouse, x_play_button, y_play_button, 200, 50) then
			play_pressed = true
			if pressed then
				stage = 1
				pressed= false
			end
			else play_pressed = false
		end
		--botao ajuda menu
		if checaToqueRectangle(x_mouse,y_mouse, x_help_button, y_help_button, 200, 50) then
			help_pressed = true
			if pressed then
				stage = 1
				pressed= false
			end
			else help_pressed = false
		end
		--botao sair
		if checaToqueRectangle(x_mouse,y_mouse, x_exit_button, y_exit_button, 200, 50) then
			exit_pressed = true
			if pressed then
				love.window.close( )
				pressed= false
			end
			else exit_pressed = false
		end
	end
end

function menu_draw()
	if stage == 0 then
		if not play_pressed then
			love.graphics.draw(play_button, x_play_button, y_play_button)
		else love.graphics.draw(play_button_pressed, x_play_button, y_play_button)
		end
		if not help_pressed then
			love.graphics.draw(help_button, x_help_button, y_help_button)
		else love.graphics.draw(help_button_pressed, x_help_button, y_help_button)
		end
		if not exit_pressed then
			love.graphics.draw(exit_button, x_exit_button, y_exit_button)
		else love.graphics.draw(exit_button_pressed, x_exit_button, y_exit_button)
		end
	end
	if stage > 0 then 
		love.graphics.setColor(0, 0, 0)
   		love.graphics.setFont(font_low)
		love.graphics.print( "pontuação total: " .. total_score, width- 250, 45)
		love.graphics.setColor(255, 255, 255)
	end
end