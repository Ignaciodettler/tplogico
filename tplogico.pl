% Ejercicio 1
esCandidato(frank, rojo).
esCandidato(claire, rojo).
esCandidato(garrett, azul).
esCandidato(jackie, amarillo).
esCandidato(linda, azul).
esCandidato(catherine, rojo).
esCandidato(seth, amarillo).
esCandidato(heather, amarillo).

edadCandidato(frank, 50).
edadCandidato(claire, 52).
edadCandidato(garrett, 64).
edadCandidato(jackie, 38).
edadCandidato(linda, 30).
edadCandidato(catherine, 59).
edadCandidato(heather, 50).

sePostula(azul, buenosAires).
sePostula(azul, chaco).
sePostula(azul, tierraDelFuego).
sePostula(azul, sanLuis).
sePostula(azul, nuequen).
sePostula(rojo, buenosAires).
sePostula(rojo, santaFe).
sePostula(rojo, cordoba).
sePostula(rojo, chubut).
sePostula(rojo, tierraDelFuego).
sePostula(rojo, sanLuis).
sePostula(amarillo, chaco).
sePostula(amarillo, formosa).
sePostula(amarillo, tucuman).
sePostula(amarillo, salta).
sePostula(amarillo, santaCruz).
sePostula(amarillo, laPampa).
sePostula(amarillo, corrientes).
sePostula(amarillo, misiones).
sePostula(amarillo, buenosAires).

habitantes(buenosAires, 15355000).
habitantes(chaco, 1143201).
habitantes(tierraDelFuego, 160720).
habitantes(sanLuis, 489255).
habitantes(neuquen, 637913).
habitantes(santaFe, 3397532).
habitantes(cordoba, 3567654).
habitantes(chubut, 577466).
habitantes(formosa, 527895).
habitantes(tucuman, 1687305).
habitantes(salta, 1333365).
habitantes(santaCruz, 273964).
habitantes(laPampa, 349299).
habitantes(corrientes, 992595).
habitantes(misiones, 1189446).

intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).


% Ejercicio 2
esPicante(UnaProvincia):-
	tieneAlMenos2Partidos(UnaProvincia),
	habitantes(UnaProvincia, Cuidadanos),
	Cuidadanos > 1000000. 

tieneAlMenos2Partidos(UnaProvincia):-
	findall(Partido, sePostula(Partido, UnaProvincia), LosPartidos),
	length(LosPartidos, Longitud),
	Longitud >= 2.


% Ejercicio 3
ganaElPrimerPartidoEnUnaProvincia(UnPartido, OtroPartido, Provincia):-
	intencionDeVotoEn(Provincia, UnPartido, PrimerPorcentaje),
	intencionDeVotoEn(Provincia, OtroPartido, SegundoPorcentaje),
	PrimerPorcentaje > SegundoPorcentaje.

leGanaA(UnCandidato, OtroCandidato, Provincia):-
	esCandidato(UnCandidato, UnPartido),
	esCandidato(OtroCandidato, OtroPartido),
	sePostulanAmbos(UnPartido, OtroPartido, Provincia),
	ganaElPrimerPartidoEnUnaProvincia(UnPartido, OtroPartido, Provincia).

leGanaA(UnCandidato,OtroCandidato, Provincia):-
	esCandidato(UnCandidato, UnPartido),
	sePostula(UnPartido, Provincia),
	esCandidato(OtroCandidato, OtroPartido),
	not(sePostula(OtroPartido, Provincia)).

leGanaA(UnCandidato, OtroCandidato, Provincia):-
	esCandidato(UnCandidato, UnPartido),
	esCandidato(OtroCandidato, UnPartido),
	sePostula(UnPartido, Provincia).	

sePostulanAmbos(UnPartido, OtroPartido, Provincia):-
	sePostula(UnPartido, Provincia),
	sePostula(OtroPartido, Provincia).


% Ejercicio 4
elGranCandidato(UnCandidato):-
	esElMenorDeSuPartido(UnCandidato),
	ganaEnDondeSePostula(UnCandidato).

esElMenorDeSuPartido(UnCandidato):-
	esCandidato(UnCandidato, UnPartido),
	forall((esCandidato(OtroCandidato, UnPartido), sonDistintosCandidatos(UnCandidato, OtroCandidato)), esMenor(UnCandidato, OtroCandidato)).

sonDistintosCandidatos(UnCandidato, OtroCandidato):-
		UnCandidato \= OtroCandidato.

esMenor(UnCandidato, OtroCandidato):-
	edadCandidato(UnCandidato, EdadPrimer),
	edadCandidato(OtroCandidato, EdadSegundo),
	EdadPrimer < EdadSegundo.

ganaEnDondeSePostula(UnCandidato):-
	esCandidato(UnCandidato, UnPartido),
	forall(sePostula(UnPartido, Provincia),ganaEnXProvincia(UnCandidato, Provincia)).

ganaEnXProvincia(UnCandidato, Provincia):-
	esCandidato(UnCandidato, UnPartido),
	sePostula(UnPartido, Provincia),
	forall(esCandidato(OtroCandidato, _), leGanaA(UnCandidato, OtroCandidato, Provincia)).


% Ejercicio 5
ajusteConsultora(UnPartido, UnaProvincia, VerdaderoPorcentajeDeVotos):-
	sePostulanAmbos(UnPartido, OtroPartido, UnaProvincia),
	ganaElPrimerPartidoEnUnaProvincia(UnPartido, OtroPartido, UnaProvincia),
	intencionDeVotoEn(UnaProvincia, UnPartido, Porcentaje),
	VerdaderoPorcentajeDeVotos is Porcentaje - 20.
	
ajusteConsultora(UnPartido, UnaProvincia, VerdaderoPorcentajeDeVotos):-
	sePostula(UnPartido, UnaProvincia),
	sePostula(_, UnaProvincia),
	ganaElPrimerPartidoEnUnaProvincia(_, UnPartido, UnaProvincia),
	intencionDeVotoEn(UnaProvincia, UnPartido, Puntaje),
	VerdaderoPorcentajeDeVotos is Puntaje + 5.


% Ejercicio 6
promete(azul, construir([edilicio(hospital, 1000), edilicio(jardin, 100), edilicio(escuela, 5)])).
promete(amarillo, construir([edilicio(hospital, 100), edilicio(universidad, 1), edilicio(comisaria, 200)])).
promete(rojo, nuevosPuestosDeTrabajo(800000)).
promete(amarillo, nuevosPuestosDeTrabajo(10000)).
promete(azul, inflacion(2, 4)).
promete(amarillo, inflacion(1, 15)).
promete(rojo, inflacion(10, 30)).

% Ejercicio 7
influenciaPromesa(inflacion(CotaInferior, CotaSuperior), Variacion):-
	Variacion is - ((CotaSuperior + CotaInferior) / 2).
	
influenciaPromesa(nuevosPuestosDeTrabajo(Cantidad), 3):-
	Cantidad > 5000.
	
influenciaPromesa(construir(Obras), VariacionFinal):-
	findall(Variacion, variacionSegunObra(Obras, Variacion), Variaciones),
	sumlist(Variaciones, VariacionFinal).

variacionSegunObra(Obras, 2):-
	member(edilicio(hospital, _), Obras).
	
variacionSegunObra(Obras, Variacion):-
	member(edilicio(jardin, Cantidad), Obras),
	Variacion is 0.1 * Cantidad.
	
variacionSegunObra(Obras, Variacion):-
	member(edilicio(escuela, Cantidad), Obras),
	Variacion is 0.1 * Cantidad.

variacionSegunObra(Obras, 2):-
	member(edilicio(comisaria, 200), Obras).

variacionSegunObra(Obras, 0):-
	member(edilicio(universidad, _), Obras).

variacionSegunObra(Obras,Variacion):-
	member(edilicio(Edificio,Cantidad), Obras),
	Edificio \= hospital,
	Edificio \= jardin,
	Edificio \= escuela,
	Edificio \= comisaria,
	Edificio \= universidad,
Variacion is - Cantidad.

% Ejercicio 8
promedioDeCrecimiento(UnPartido, SumatoriaDeCrecimiento):-
	promesaInflacionPartido(UnPartido,VariacionInflacion),
	promesaInflacionConstruccion(UnPartido, VariacionConstruccion),
	promesaInflacionTrabajo(UnPartido, VariacionTrabajo),
	SumatoriaDeCrecimiento is VariacionInflacion + VariacionConstruccion + VariacionTrabajo.

promesaInflacionPartido(UnPartido, VariacionInflacion):-
	promete(UnPartido,inflacion(CotaInferior, CotaSuperior)),
	influenciaPromesa(inflacion(CotaInferior, CotaSuperior), VariacionInflacion).

promesaInflacionConstruccion(UnPartido, VariacionConstruccion):-
	promete(UnPartido,construir(Obras)),
	influenciaPromesa(construir(Obras), VariacionConstruccion).

promesaInflacionTrabajo(UnPartido, VariacionTrabajo):-
	promete(UnPartido,nuevosPuestosDeTrabajo(Cantidad)),
	influenciaPromesa(nuevosPuestosDeTrabajo(Cantidad), VariacionTrabajo).

promesaInflacionTrabajo(UnPartido, 0):-
	not(promete(UnPartido,nuevosPuestosDeTrabajo(_))).

