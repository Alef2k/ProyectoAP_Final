
package com.portfolio.alef.Interface;

import com.portfolio.alef.Entity.Persona;
import java.util.List;


public interface IPersonaService {
    // agregamos los metodos
    // traer una persona
    public List<Persona> getPersona ();
    
    // Guardar un obj. de tipo persona
    public void savePersona (Persona persona);
    
    // Eliminar un objeto por ID
    public void deletePersona(Long id);
    
    // Buscar una persona por ID
    public Persona findPersona(Long id);
    
    
    
    
}
