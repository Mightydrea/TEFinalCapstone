package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.Position;
import com.techelevator.model.PositionDAO;
import com.techelevator.model.User;

@Controller
@SessionAttributes("user")
public class AdminController {

	@Autowired
	private PositionDAO positionDao;

	@RequestMapping(path = "/listPositions", method = RequestMethod.GET)
	public String displaySearchPositionsPage(ModelMap map) {

		if (!map.containsAttribute("user")) {
			map.addAttribute("user", new User());
		}

		User currentUser = (User) map.get("user");
		if (currentUser.getRole() == null) {
			return "redirect:/login";
		} else if (!currentUser.getRole().equals("admin")) {
			return "redirect:/login";
		}

		List<Position> positions = positionDao.getAllPositions();
		map.addAttribute("positions", positions);
		return "listPositions";
	}

}
