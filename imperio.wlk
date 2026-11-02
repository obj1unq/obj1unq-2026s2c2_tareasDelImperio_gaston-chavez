class Tarea{
    method recursosProducidos(tiempo) {
      return 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()
    }

    method desgaste(tiempo)
    method esfuerzo()  
}

class Siembra inherits Tarea {
    var property esfuerzo 
    override method desgaste(tiempo) {
      return 1 + 0.max(tiempo - self.horasDeTrabajo())
    }

    method horasDeTrabajo() 
}

class Valle inherits Siembra {
    var estacionDelAño = epocaLluvia

    override method desgaste(tiempo) {
      return if(estacionDelAño.puedeSembrar()) super(tiempo) else 0
    }

    method estacionDelAño(_estacionDelAño) {
      estacionDelAño = _estacionDelAño
    }

    override method horasDeTrabajo() {
      return 8
    }
}

object epocaLluvia {
    method puedeSembrar() {
      return false
    }
}

object epocaSequia {
  method puedeSembrar() {
    return true
  }
}

class Terrazas inherits Siembra {
    override method recursosProducidos(tiempo) {
      return 3 * super(tiempo)
    }

    override method horasDeTrabajo() {
      return 6
    }
}

class Mensaje inherits Tarea {
    override method esfuerzo() {
      return 1.4
    }

    override method desgaste(tiempo) {
      return tiempo / 4
    }
}

class MensajeImperial inherits Mensaje {
    override method esfuerzo() {
      return 1.8
    }

    override method desgaste(tiempo) {
      return 1.max((tiempo / 4) - 2)
    }
}