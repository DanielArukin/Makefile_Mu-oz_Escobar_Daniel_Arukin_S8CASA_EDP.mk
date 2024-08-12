resultados.pdf : resultados.tex muñoz_escobar_daniel_arukin_s7casa_plots.pdf

muñoz_escobar_daniel_arukin_s7casa_plots.pdf : muñoz_escobar_daniel_arukin_s7casa_plots.py datos_euler_2orden_sol_fijo.dat datos_LeapFrog_sol_fijo.dat datos_tierra_euler_2orden_sol_libre.dat datos_sol_libre_euler_2orden.dat datos_tierra_LeapFrog_sol_libre.dat datos_sol_libre_LeapFrog.dat
	python3 muñoz_escobar_daniel_arukin_s7casa_plots.py

datos_euler_2orden_sol_fijo.dat : Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolFijo.cpp
	g++ Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolFijo.cpp
	./a.out>>sol_fijo.dat

datos_LeapFrog_sol_fijo.dat : Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolFijo.cpp
	g++ Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolFijo.cpp
	./a.out>>datos_LeapFrog_sol_fijo.dat

datos_tierra_euler_2orden_sol_libre.dat : Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolLibre.cpp
	g++ Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolLibre.cpp
	./a.out>>datos_tierra_euler_2orden_sol_libre.dat

datos_sol_libre_euler_2orden.dat : Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolLibre.cpp
	g++ Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolLibre.cpp
	./a.out>>datos_sol_libre_euler_2orden.dat

datos_tierra_LeapFrog_sol_libre.dat : Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolLibre.cpp
	g++ Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolLibre.cpp
	./a.out>>datos_tierra_LeapFrog_sol_libre.dat

datos_sol_libre_LeapFrog.dat : Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolLibre.cpp
	g++ Muñoz_Escobar_Daniel_Arukin_S7CASA_TierraSolLibre.cpp
	./a.out>>datos_sol_libre_LeapFrog.dat
