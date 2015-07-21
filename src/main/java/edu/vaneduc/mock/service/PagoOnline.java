package edu.vaneduc.mock.service;

import javax.jws.WebService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import edu.vaneduc.mock.dto.PagoDTO;
import edu.vaneduc.mock.dto.ResultadoDTO;
import edu.vaneduc.mock.facade.ServiceFacade;


@WebService(endpointInterface ="edu.vaneduc.mock.service.IPagoOnline")
public class PagoOnline  implements IPagoOnline{
	
	@Autowired
	ServiceFacade serviceFacade;
   
	 
	private static final Logger logger = LoggerFactory.getLogger(PagoOnline.class);
	
	public ResultadoDTO pagarCompraOnline(PagoDTO pago) {
	ResultadoDTO resultado = new ResultadoDTO();
	try{
		serviceFacade.autorizarPago(pago);
	}catch(Exception ex){
		logger.error(ex.getMessage());
		resultado.setEstado("Error");
	}
	return resultado;
	}

	public ResultadoDTO anularCompraOnline(PagoDTO pago) {
		ResultadoDTO resultado = new ResultadoDTO();
		try{
			serviceFacade.anularPago(pago);
		}catch(Exception ex){
			logger.error(ex.getMessage());
			resultado.setEstado("Error");
		}
		return resultado;
	}
	
}
