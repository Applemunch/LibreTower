if decreasealpha and alpha > 0
	alpha -= 0.03

if textpos != 16 {
	textpos += sign(16 - textpos)
}

if alpha <= 0 instance_destroy(self)