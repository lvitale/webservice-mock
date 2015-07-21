package edu.vaneduc.mock.service;

import javax.jws.WebService;

import edu.vaneduc.mock.dto.PagoDTO;
import edu.vaneduc.mock.dto.ResultadoDTO;

@WebService
public interface IPagoOnline {

	
	 ResultadoDTO  pagarCompraOnline(PagoDTO pago);
	 ResultadoDTO  anularCompraOnline(PagoDTO pago);
	
}
