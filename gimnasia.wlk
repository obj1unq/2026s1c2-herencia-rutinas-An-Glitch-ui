// ======================================== SUPER CLASES =========================================
class Rutina {
    //var property tiempo = null
    //var property caloriasABajar = 100 * (tiempo - descanso) * intensidad

    method descanso(tiempo)
    method intensidad()
    method caloriasABajarPor(tiempo) {
        100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }
}

class Persona{
    
}

// ================================ SUBCLASES ===============================
class RutinaRunning inherits Rutina{
    override method intensidad() = 1.2

    override method descanso(tiempo) {
        if (tiempo > 20){
            return 5
        } else {
            return 2
        }
    }
}

class RutinaMaraton inherits RutinaRunning{
    override method caloriasABajarPor(tiempo) {
        super(tiempo) * 2
    }
}

class RutinaRemo inherits Rutina{
    override method intensidad() = 1.3

    override method descanso(tiempo){
        return tiempo / 5
    }
}

class RutinaRemoDeCompeticion inherits RutinaRemo{
    override method intensidad() = 1.7
    //override method descanso(tiempo) = 2.max(super.descanso(tiempo))
    override method descanso(tiempo) = 2.max(super(tiempo))
}