package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.Position;
import com.techelevator.model.PositionDAO;

@RestController
@CrossOrigin
@RequestMapping("/api")
@SessionAttributes("user")
public class PositionRestController {

	@Autowired
	private PositionDAO positionDao;

	@GetMapping
	public List<Position> list() {
		return positionDao.getAllPositions();
	}

	@PutMapping("updateDisplayedPosition/{id}/{isDisplayed}")
	public void updateDisplayed(@PathVariable("id") long id, @PathVariable("isDisplayed") boolean isDisplayed) {
		positionDao.updateDisplayedCheckbox(id, isDisplayed);
	}

	@GetMapping("/positionsByRegion")
	public List<Position> listByRegion(@RequestParam String areaOfCity) {
		return positionDao.getAllVisiblePositionsByRegion(areaOfCity);
	}

	@PutMapping("updatePickUpLocation/{id}/{pickUpLocation}")
	public void updatePickUpLocation(@PathVariable("id") long id,
			@PathVariable("pickUpLocation") String pickUpLocation) {
		positionDao.updatePickUpLocation(id, pickUpLocation);
	}

	@PutMapping("removePickUpLocation/{id}")
	public void removePickUpLocation(@PathVariable("id") long id) {
		String empty = "";
		positionDao.updatePickUpLocation(id, empty);
	}

}
