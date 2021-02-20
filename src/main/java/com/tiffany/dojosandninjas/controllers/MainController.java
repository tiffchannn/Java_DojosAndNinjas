package com.tiffany.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;

import com.tiffany.dojosandninjas.models.Dojo;
import com.tiffany.dojosandninjas.models.Ninja;
import com.tiffany.dojosandninjas.services.DojoService;
import com.tiffany.dojosandninjas.services.NinjaService;

@Controller
public class MainController {
	
	@Autowired
	private DojoService dojoService;
	
	@Autowired
	private NinjaService ninjaService;
	
	@GetMapping("/")
	public String index(Model model) {
        List<Ninja> ninjas = ninjaService.allNinjas();
        model.addAttribute("ninjas", ninjas);
        model.addAttribute("dojos", dojoService.allDojos());
        return "index.jsp";
	}
	
	@GetMapping("/ninjas")
	public String showNinjas(@ModelAttribute("ninja") Ninja ninja, Model model) {
		model.addAttribute("dojos", dojoService.allDojos());
		model.addAttribute("ninjas", ninjaService.allNinjas());
		return "ninjas.jsp";
	}
	
	@GetMapping("/dojos")
	public String showDojos(@ModelAttribute("dojo") Dojo dojo, Model model) {
		model.addAttribute("dojos", dojoService.allDojos()); // now we can show all dojos in jsp
		return "dojos.jsp";
	}
	
	 @RequestMapping(value="/dojos/{id}")
	    public String showDojoInfo(@PathVariable("id") Long id, Model model) {
		 	Dojo dojo = dojoService.findDojo(id);
	    	model.addAttribute("dojo", dojo);
	    	model.addAttribute("ninjas", ninjaService.findNinjasByDojo(dojo));
	    	return "showDojo.jsp";
	    }
	
	@PostMapping("/dojos")
	public String createDojo(@Valid @ModelAttribute("dojo")Dojo dojo, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("Error creating a dojo!");
			return "dojos.jsp";
		} else {
			dojoService.createDojo(dojo);
			System.out.println("Dojo was created!");
			return "redirect:/";
		}
	}
	
	@PostMapping("/ninjas")
	public String createNinja(@Valid @ModelAttribute("ninja")Ninja ninja, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("Error creating a ninja!");
			return "ninjas.jsp";
		} else {
			ninjaService.createNinja(ninja);
			System.out.println("Ninja was created!");
			return "redirect:/";
		}
	}
	
}
