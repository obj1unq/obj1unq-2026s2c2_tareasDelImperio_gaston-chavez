import imperio.*
import habitantes.*

class Ayllu {
    const colcas

    method laMejorColcaPara(habitante) {
        return colcas.max({colca => colca.recursosProducidos(habitante.tiempo())})
    }

    method colcasSuavesPara(habitante) {
        return colcas.filter({colca => colca.esColcaSuave(habitante.tiempo())})
    }

    method tareaMasExigentePara(habitante) {
      return colcas.map({colca => colca.tareaMasExigente(habitante.tiempo())})
    }
}

class Colca {
    const tareas

    method recursosProducidos(tiempo) {
        return tareas.sum({tarea => tarea.recursosProducidos(tiempo)})
    }

    method esColcaSuave(tiempo) {
        return tareas.any({tarea => tarea.recursosProducidos(tiempo) < 200})
    }

    method tareaMasExigente(tiempo) {
        return tareas.max({tarea => tarea.recursosProducidos(tiempo)})
    }
}