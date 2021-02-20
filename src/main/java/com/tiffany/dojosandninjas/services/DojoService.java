package com.tiffany.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tiffany.dojosandninjas.models.Dojo;
import com.tiffany.dojosandninjas.repos.DojoRepository;

@Service
public class DojoService {
	
	@Autowired
	private DojoRepository dojoRepo;
	
	
	public DojoService(DojoRepository dojoRepo) {
		this.dojoRepo = dojoRepo;
	}
	
	 // returns all the dojos
    public List<Dojo> allDojos() {
        return dojoRepo.findAll();
    }
    // creates a dojo
    public Dojo createDojo(Dojo b) {
        return dojoRepo.save(b);
    }
    // retrieves a dojo
    public Dojo findDojo(Long id) {
        Optional<Dojo> optionalDojo = dojoRepo.findById(id);
        if(optionalDojo.isPresent()) {
            return optionalDojo.get();
        } else {
            return null;
		}
	}
}
