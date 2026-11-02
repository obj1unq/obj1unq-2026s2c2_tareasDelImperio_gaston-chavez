class Persona{
    var property energia //se utiliza property para el caso de prueba
    method energiaPerdida(tarea) {
        return tarea.recursosProducidos(self.tiempo()) / self.indiceResistencia()
    }

    method tiempo()

    method indiceResistencia()

    method aplicarTarea(tarea) {
        self.validarSiPuedeAplicarTarea(tarea)
        energia = energia - self.energiaPerdida(tarea)
    }

    method validarSiPuedeAplicarTarea(tarea) {
        if(not self.puedeRealizarTarea(tarea)){
            self.error("no puede aplicar tarea")
        }
    }

    method puedeRealizarTarea(tarea)
}

class Campesino inherits Persona {
    var property tiempo
    
    override method indiceResistencia() {
        return 10
    }

    override method puedeRealizarTarea(tarea){
        return energia >= self.energiaPerdida(tarea)
    }
}

class Elite inherits Persona {
    
    override method tiempo() {
      return 10
    }
    
    override method indiceResistencia() {
        return 12
    }

    override method energiaPerdida(tarea){
        return super(tarea) - 5
    }

    override method puedeRealizarTarea(tarea){
        return tarea.recursosProducidos(self.tiempo()) > 500
    }
}