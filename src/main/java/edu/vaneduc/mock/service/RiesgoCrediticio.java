package edu.vaneduc.mock.service;

import javax.jws.WebService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import edu.vaneduc.mock.dto.PersonaDTO;
import edu.vaneduc.mock.dto.ResultadoDTO;
import edu.vaneduc.mock.facade.ServiceFacade;

@WebService(endpointInterface ="edu.vaneduc.mock.service.IRiesgoCrediticio")
public class RiesgoCrediticio implements IRiesgoCrediticio {

	@Autowired
	ServiceFacade serviceFacade;
   
	 
	private static final Logger logger = LoggerFactory.getLogger(PagoOnline.class);
	
	public ResultadoDTO consultarRiesgoCrediticio(PersonaDTO persona){
		ResultadoDTO resultado = new ResultadoDTO();
		try{
			serviceFacade.consultarRiesgoCrediticio(persona);
		}catch(Exception ex){
			logger.error(ex.getMessage());
			resultado.setEstado("Error");
		}
		return resultado;
	}
}
