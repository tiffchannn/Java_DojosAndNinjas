package com.tiffany.dojosandninjas.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tiffany.dojosandninjas.models.Dojo;
import com.tiffany.dojosandninjas.models.Ninja;
import com.tiffany.dojosandninjas.repos.NinjaRepository;

@Service
public class NinjaService {
	private final NinjaRepository ninjaRepo;
	
	public NinjaService(NinjaRepository ninjaRepo) {
		this.ninjaRepo = ninjaRepo;
	}
	
	 // returns all the ninjas
    public List<Ninja> allNinjas() {
        return ninjaRepo.findAll();
    }
    // creates a ninja
    public Ninja createNinja(Ninja b) {
        return ninjaRepo.save(b);
    }
    // retrieves a ninja
    public Ninja findNinja(Long id) {
        Optional<Ninja> optionalNinja = ninjaRepo.findById(id);
        if(optionalNinja.isPresent()) {
            return optionalNinja.get();
        } else {
            return null;
        }
    }
    
    public List<Ninja> findNinjasByDojo(Dojo dojo) {
        List<Ninja> ninjaList = ninjaRepo.findAll();
        ArrayList<Ninja> result = new ArrayList<Ninja>();
        for (Ninja ninja: ninjaList) {
        	if (ninja.getDojo() == dojo) {
        		result.add(ninja);
        	}
        }
        return result;
    }
}
