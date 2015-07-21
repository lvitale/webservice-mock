package edu.vaneduc.mock.service;

import javax.jws.WebService;

import edu.vaneduc.mock.dto.PersonaDTO;
import edu.vaneduc.mock.dto.ResultadoDTO;

@WebService
public interface IRiesgoCrediticio {

	ResultadoDTO consultarRiesgoCrediticio(PersonaDTO persona);
}
