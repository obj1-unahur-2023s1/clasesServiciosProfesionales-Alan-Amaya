// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(num){ litoral.recaudaciones() = num }
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar(){return universidad.provincia()}
	method honorariosPorHora() { return universidad.honorarios()}
	method cobrar(num){ universidad.donaciones() += num/2 }
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	var property provinciasDondePuedeTrabajar = []
	var property honorariosPorHora = 0
	var property ahorros = 0
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method cobrar(num){
		ahorros += num
	}
}


class empresa {
	var property honorariosRef = 0
	var contratados = []
	
	method contratadosDe_(universidad){
		return contratados.count( {profesional => profesional.universidad() == universidad} )
	}
	
	method profesionalesCaros(){
		return contratados.filter( {profesional => profesional.honorarios()> self.honorarioRef()} )
	}
	
	method universidadesFormadoras(){
		return contratados.asSet( {profesional => profesional.universidades()} )
	}
	
	method elMasBarato(){
		return contratados.min( {profesional => profesional.honorarios()} )
	}
	
	method hayGenteAcotada(){
		return contratados.all( {profesional => profesional.provinciasDondePuedeTrabajar().size() <= 3} )
	}
	
	method puedeSatisfacer(solicitante){
		return contratados.any( {profesional=> solicitante.puedeSerAtendidoPor_(profesional)} )
	}
}

class universidades {
	var property provincia = []
	var property honorariosRef = 0
	var property donaciones = 0
}

class persSolicitante {
	var property provincia
	method puedeSerAtendidoPor_(profesional){
		profesional.provinciasDondePuedeTrabajar().contain(self.provincia())
	}
}
class instSolicitante {
	var property uni = []
	method puedeSerAtendidoPor_(profesional){
		profesional.provinciasDondePuedeTrabajar().contain(self.uni())
	}
}

object litoral {
	var property recaudaciones = 0
}