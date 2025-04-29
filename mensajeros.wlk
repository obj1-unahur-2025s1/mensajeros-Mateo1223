object paquete {
  var estaPago = false
  var destino = null
  var mensajero = null

  method definirMensajero(unMensajero) {
    mensajero = unMensajero
  }

  method definirDestino(unDestino) {
    destino = unDestino
  }

  method pagarPaquete() {
    estaPago = true
  }
  method puedeEntregarse() = destino.dejaPasar(mensajero) and self.estaPago()
  method estaPago() = estaPago
}

object puendeDeBrooklyn {
  method dejaPasar(unMensajero) = unMensajero.peso() < 1000
}

object laMatrix {
  method dejaPasar(unMensajero) = unMensajero.puedeLlamar()
}

object roberto {
  var transporte = bicicleta
  
  method cambiarTransporte(unTransporte) {
    transporte = unTransporte
  }

  method puedeLlamar() = false 
  method peso() = transporte.peso() + 90
  
}

object chuckNorris {
  method puedeLlamar() = true
  method peso() = 80
}

object neo {
  var tieneCredito = true

  method cargarCredito() {
    tieneCredito = true
  }

  method agotarCredito() {
    tieneCredito = false
  }

  method puedeLlamar() = tieneCredito
  method peso() = 0
}

object bicicleta {
  method peso() = 5
}

object camion {
  var acoplados = 1

  method agregarAcoplado() {
    acoplados += 1
  }

  method sacarAcoplado() {
    acoplados = (acoplados - 1).max(0)
  }

  method peso() = acoplados * 500
}
