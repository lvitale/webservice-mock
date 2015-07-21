package edu.vaneduc.mock.facade;

import edu.vaneduc.mock.dto.PagoDTO;
import edu.vaneduc.mock.dto.PersonaDTO;

public class ServiceFacade {

	public boolean autorizarPago(PagoDTO pago){
		return true;
	}
	public boolean anularPago(PagoDTO pago){
		return true;
	}
	
	public Integer consultarRiesgoCrediticio(PersonaDTO persona){
		if("28260412".equals(persona.getDocumento())){
			return 6;
		}
		return 0;
	}
}
