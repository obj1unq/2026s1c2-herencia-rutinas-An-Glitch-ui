class Rutina {
    //var property tiempo = null
    //var property caloriasABajar = 100 * (tiempo - descanso) * intensidad

    method descanso(tiempo)
    method intensidad()
    method caloriasABajarPor(tiempo)
}

class RutinaRunning inherits Rutina{
    var property intensidad = null
    //var property tiempo = null

    override method descanso(tiempo) {
        if (tiempo > 20){
            return 5
        } else {
            return 2
        }
    }

    override method caloriasABajarPor(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * intensidad
    }
}

class RutinaMaraton inherits Rutina{

}

class RutinaRemo inherits Rutina{

}

class RutinaRemoDeCompeticion inherits Rutina{

}
