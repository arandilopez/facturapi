module Facturapi
  class Invoice < Base
    module Type
      INGRESO = 'I'
      EGRESO = 'E'
      PAGO = 'P'
    end

    module PaymentForm
      EFECTIVO = '01';
      CHEQUE_NOMINATIVO = '02';
      TRANSFERENCIA_ELECTRONICA = '03';
      TARJETA_DE_CREDITO = '04';
      MONEDERO_ELECTRONICO = '05';
      DINERO_ELECTRONICO = '06';
      VALES_DE_DESPENSA = '08';
      DACION_EN_PAGO = '12';
      SUBROGACION = '13';
      CONSIGNACION = '14';
      CONDONACION = '15';
      COMPENSACION = '17';
      NOVACION = '23';
      CONFUSION = '24';
      REMISION_DE_DEUDA = '25';
      PRESCRIPCION_O_CADUCIDAD = '26';
      A_SATISFACCION_DEL_ACREEDOR = '27';
      TARJETA_DE_DEBITO = '28';
      TARJETA_DE_SERVICIOS = '29';
      POR_DEFINIR = '99';
    end

    module TaxType
      IVA = 'IVA';
      IEPS = 'IEPS';
      ISR = 'ISR';
    end

    module Relation
      NOTA_DE_CREDITO = '01';
      NOTA_DE_DEBITO = '02';
      DEVOLUCION = '03';
      SUSTITUCION = '04';
      TRASLADOS = '05';
      FACTURA_POR_TRASLADOS = '06';
      CDFI_POR_ANTICIPO = '07';
      FACTURA_POR_PARCIALIDADES = '08';
      FACTURA_POR_DIFERIDOS = '09';
    end
  end
end
