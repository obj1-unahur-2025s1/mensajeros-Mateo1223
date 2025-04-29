object paquete {
  var estaPago = false
  var destino = null


  method definirDestino(unDestino) {
    destino = unDestino
  }

  method pagarPaquete() {
    estaPago = true
  }
  method precio() = 50
  method puedeEntregarse(unMensajero) = destino.dejaPasar(unMensajero) and self.estaPago()
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


object empresaMensajeria {
  const mensajeros = []
  const paquetesPendientes = []
  const paquetesEnviados = []

  method contratar(unMensajero) {
    mensajeros.add(unMensajero)
  }

  method despedir(unMensajero) {
    mensajeros.remove(unMensajero)
  }

  method enviar(unPaquete) {
    if (self.puedeEntregarsePorAlguno(unPaquete)){
      paquetesEnviados.add(unPaquete)
    }
    else{
      paquetesPendientes.add(unPaquete)
    }
  }

  method enviarPaquetes(listaDePaquetes) {
    listaDePaquetes.forEach({p => self.enviar(p)})
  }

  method enviarPendienteMasCaro() {
    if (self.puedeEntregarsePorAlguno(self.paquetePendienteMasCaro())){
      self.enviar(self.paquetePendienteMasCaro())
      paquetesPendientes.remove(self.paquetePendienteMasCaro())
    }
  }

  method mensajeros() = mensajeros
  method esGrande() = mensajeros.size() > 2
  method puedeEntregarsePaquete() = paquete.puedeEntregarse(mensajeros.first())
  method pesoUltimoMensajero() = mensajeros.last().peso()

  method paquetePendienteMasCaro() = paquetesPendientes.max({p => p.precio()}) 
  method puedeEntregarsePorAlguno(unPaquete) = mensajeros.any({m => unPaquete.puedeEntregarse(m)})
  method losQuePuedenEntregar(unPaquete) = mensajeros.filter({m => unPaquete.puedeEntregarse(m)})
  method pesosDeLosMensajeros() = mensajeros.sum({m => m.peso()})
  method tieneSobrepeso() = (self.pesosDeLosMensajeros() / mensajeros.size()) > 500
  method facturacion() = paquetesEnviados.sum({p => p.precio()})


  
}

object paquetito {
  method puedeEntregarse(unMensajero) = true
  method estaPago() = true
  method precio() = 0
}

object paqueton {
  const destinos = []
  var importePagado = 0


  method agregarDestino(unDestino) {
    destinos.add(unDestino)
  }
  
  method pagar(unImporte) {
    importePagado += unImporte
  }

  method precio() = 100 * destinos.size()
  method estaPago() = importePagado >= self.precio()
  method puedePasarPorDestinos(unMensajero) = destinos.all({d => d.dejaPasar(unMensajero)})
  method puedeEntregarse(unMensajero) = self.estaPago() and self.puedePasarPorDestinos(unMensajero)
}