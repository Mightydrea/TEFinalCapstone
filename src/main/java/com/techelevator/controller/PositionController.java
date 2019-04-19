package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.Position;
import com.techelevator.model.PositionDAO;

@Controller
@SessionAttributes("user")
public class PositionController {

	@Autowired
	private PositionDAO positionDao;

	@RequestMapping(path = "/searchPositions", method = RequestMethod.GET)
	public String displaySearchPositionsPage(ModelMap map) {
		List<Position> positions = positionDao.getAllVisiblePositions();
		map.addAttribute("positions", positions);
		return "searchPositions";
	}

	@RequestMapping(path = "/positionsByRegion", method = RequestMethod.GET)
	public String displaypositionsByRegionPage(@RequestParam String areaOfCity, ModelMap map) {

		List<Position> positions = positionDao.getAllVisiblePositionsByRegion(areaOfCity);
		map.addAttribute("positions", positions);
		return "searchPositions";
	}

	@RequestMapping(path = "/filterPositions", method = RequestMethod.GET)
	public String filterPositionsOnSearchPositionsPage(@RequestParam String benefits, @RequestParam String areaOfCity,
			@RequestParam String hourlyType, @RequestParam String shift, @RequestParam String hireType,
			@RequestParam String secondChanceEmployer, ModelMap map) {
		List<Position> positions = positionDao.getFilteredPositions(benefits, areaOfCity, hourlyType, shift, hireType,
				secondChanceEmployer);
		map.addAttribute("positions", positions);
		return "searchPositions";
	}
}
