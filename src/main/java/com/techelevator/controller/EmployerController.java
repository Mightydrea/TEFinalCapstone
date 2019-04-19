package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Employer;
import com.techelevator.model.EmployerDAO;
import com.techelevator.model.Position;
import com.techelevator.model.PositionDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
@SessionAttributes("user")
public class EmployerController {

	@Autowired
	private EmployerDAO employerDao;
	@Autowired
	private PositionDAO positionDao;
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "/createEmployer", method = RequestMethod.GET)
	public String displayCreateEmployerFormPage(ModelMap map) {

		if (!map.containsAttribute("employer")) {
			map.addAttribute("employer", new Employer());
		}

		if (!map.containsAttribute("user")) {
			map.addAttribute("user", new User());
		}

		User currentUser = (User) map.get("user");
		if (currentUser.getRole() == null) {
			return "redirect:/login";
		} else if (!currentUser.getRole().equals("admin")) {
			return "redirect:/login";
		}

		return "createEmployer";
	}

	@RequestMapping(path = "/submit", method = RequestMethod.POST)
	public String submitCreateEmployerFrom(@Valid @ModelAttribute("employer") Employer employer, BindingResult result,
			RedirectAttributes attr, ModelMap map) {

		if (result.hasErrors()) {
			return "createEmployer";
		}

		employerDao.createEmployer(employer);

		attr.addFlashAttribute("employer", employer);
		return "redirect:/employerConfirmationPage";
	}

	@RequestMapping(path = "/employerConfirmationPage", method = RequestMethod.GET)
	public String displayNewEmployerConfirmationPage(ModelMap map) {

		if (!map.containsAttribute("employer")) {
			map.addAttribute("employer", new Employer());
		}

		if (!map.containsAttribute("user")) {
			map.addAttribute("user", new User());
		}
		return "employerConfirmationPage";
	}

	@RequestMapping(path = "/employerPositions", method = RequestMethod.GET)
	public String displayEmployerPositionsPage(ModelMap map) {
		if (!map.containsAttribute("user")) {
			map.addAttribute("user", new User());
		}

		User currentUser = (User) map.get("user");
		if (currentUser.getRole() == null) {
			return "redirect:/login";
		} else if (!currentUser.getRole().equals("employer")) {
			return "redirect:/login";
		}

		Long employerId = currentUser.getEmployerId();
		List<Position> positions = positionDao.getPositionsByEmployerId(employerId);
		map.addAttribute("positions", positions);
		return "employerPositions";
	}

	@RequestMapping(path = "/editPosition", method = RequestMethod.GET)
	public String displayEditPositionsPage(HttpServletRequest request, @RequestParam long positionId, ModelMap map) {
		if (!map.containsAttribute("user")) {
			map.addAttribute("user", new User());
		}

		User currentUser = (User) map.get("user");
		if (currentUser.getRole() == null) {
			return "redirect:/login";
		} else if (!currentUser.getRole().equals("employer")) {
			return "redirect:/login";
		}

		Position position = positionDao.getPositionByPositionId(positionId);
		map.addAttribute("position", position);
		return "editPosition";
	}

	@RequestMapping(path = "/editPosition", method = RequestMethod.POST)
	public String displayEditPositionsPageRedirect(@Valid @ModelAttribute("position") Position position,
			BindingResult result, RedirectAttributes attr, ModelMap map) {

		if (result.hasErrors()) {
			attr.addFlashAttribute("positionId", position.getPositionId());
			return "editPosition";
		}

		positionDao.updatePosition(position);
		attr.addFlashAttribute("position", position);
		return "redirect:/editPositionConfirmation";
	}

	@RequestMapping(path = "/editPositionConfirmation", method = RequestMethod.GET)
	public String displayEditPositionsPage(ModelMap map) {
		return "editPositionConfirmation";
	}

	@RequestMapping(path = "/addPosition", method = RequestMethod.GET)
	public String displayAddPositionFormPage(ModelMap map) {

		if (!map.containsAttribute("position")) {
			map.addAttribute("position", new Position());
		}

		if (!map.containsAttribute("user")) {
			map.addAttribute("user", new User());
		}

		User currentUser = (User) map.get("user");
		if (currentUser.getRole() == null) {
			return "redirect:/login";
		} else if (!currentUser.getRole().equals("employer")) {
			return "redirect:/login";
		}

		return "addPosition";
	}

	@RequestMapping(path = "/addPosition", method = RequestMethod.POST)
	public String addPositionFormSubmissionRedirect(@Valid @ModelAttribute("position") Position position,
			BindingResult result, RedirectAttributes attr, ModelMap map) {
		if (result.hasErrors()) {
			return "addPosition";
		}

		positionDao.addPosition(position);
		attr.addFlashAttribute("position", position);

		return "redirect:/positionConfirmationPage";
	}

	@RequestMapping(path = "/positionConfirmationPage", method = RequestMethod.GET)
	public String displayAddPositionConfirmationPage(ModelMap map) {

		if (!map.containsAttribute("position")) {
			map.addAttribute("position", new Position());
		}
		return "positionConfirmationPage";
	}
}
