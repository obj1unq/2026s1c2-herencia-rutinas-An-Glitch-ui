// ======================================== SUPER CLASES =========================================
class Rutina {
    //var property tiempo = null
    //var property caloriasABajar = 100 * (tiempo - descanso) * intensidad

    method descanso(tiempo)
    method intensidad()
    method caloriasABajarPor(tiempo) {
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }
}
// ================================== PERSONA ==============================
class Persona{
    var property peso = null

    method pesoQuePierdeAlRutinar(rutina){
        self.validarHacerRutinaPor(rutina, self.tiempoARutinar())
        rutina.caloriasABajarPor(self.tiempoARutinar()) / self.kilosPorCaloría()
    }

    method validarHacerRutinaPor(r, t) {
        if (not self.puedeAplicarRutina()){
            self.error("Tu peso está por debajo de los 50kg, no podes aplicar "+r)
        }
    }
}

// ============================== CLUB =============================
class Club{
    
}

// =============================== SUBCLASES ===============================
// =============================== RUTINAS ===============================
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

// =================================== PERSONAS ====================================
class PersonaSedentaria inherits Persona{
    const property kilosPorCaloría  = 7000
    var property tiempoARutinar = null

    method puedeAplicarRutina() {
        return peso >= 50
    }
}

class PersonaAtleta inherits Persona{
    const property kilosPorCaloría  = 8000
    const property tiempoARutinar = 90

    override method pesoQuePierdeAlRutinar(rutina) {
        //return (rutina.caloriasABajarPor() / kilosPorCaloría) - 1
        super.pesoQuePierdeAlRutinar(rutina, tiempoARutinar) - 1
    }

    method puedeAplicarRutina(rutina) {  //Solo realizan una rutina si las calorías que consumiría al realizarla es mayor a 10000
        return rutina.caloriasABajarPor(90) > 10000
    }
}
