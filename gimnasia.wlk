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

class Persona{
    var property peso = null

    method pesoQuePierdeAlRutinar(rutina, tiempo){
        self.validarHacerRutinaPor(rutina, tiempo)
        rutina.caloriasABajarPor(self.tiempoARutinar()) / self.kilosPorCaloría()
    }

    method validarHacerRutinaPor(r, t) {
        if (not self.puedeAplicarRutina()){
            self.error("Tu peso está por debajo de los 50kg, no podes aplicar "+r)
        }
    }
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
    var property tiempoQueEjercita = null

    //override method pesoQuePierdeAlRutinar(rutina, tiempo)

    //method kilosPorCaloríaQuePierde(rutina, tiempo) {
    //    return peso - kilosPorCaloría
    //}

    method puedeAplicarRutina() {
        return peso >= 50
    }
}

class PersonaAtleta inherits Persona{
    const property kilosPorCaloría  = 8000
    const property tiempoARutinar = 90

    override method pesoQuePierdeAlRutinar(rutina, tiempoARutinar) {
        return (rutina.caloriasABajarPor() / kilosPorCaloría) - 1
    }

    method puedeAplicarRutina(rutina) {  //Solo realizan una rutina si las calorías que consumiría al realizarla es mayor a 10000
        return rutina.caloriasABajarPor(90) > 10000
    }
}
