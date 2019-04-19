package com.techelevator.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
@SessionAttributes("user")
public class AuthenticationController {

	private UserDAO userDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	// registration page
	@RequestMapping(path = "/users/new", method = RequestMethod.GET)
	public String displayNewUserForm(ModelMap map) {
		if (!map.containsAttribute("user")) {
			map.addAttribute("user", new User());
		}

		User currentUser = (User) map.get("user");
		if (currentUser.getRole() == null) {
			return "redirect:/login";
		} else if (!currentUser.getRole().equals("admin")) {
			return "redirect:/login";
		}

		return "newUser";
	}

	@RequestMapping(path = "/users", method = RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
		if (result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			System.out.println("errors");
			return "redirect:/users/new";
		}
		userDAO.saveUser(user.getUserName(), user.getPassword(), user.getRole());
		return "redirect:/login";
	}

	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String displayLoginForm(ModelMap map) {
		if (!map.containsAttribute("user")) {
			map.addAttribute("user", new User());
		}
		return "login";
	}

	// POST: /login
	// Validate the model and redirect to splashPage(home) (if successful) or return
	// the
	// login view (if validation fails)
	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String confirmValidLogin(@Valid @ModelAttribute("user") User userLogin, BindingResult result,
			RedirectAttributes attr, ModelMap map) {

		if (!userDAO.searchForUsernameAndPassword(userLogin.getUserName(), userLogin.getPassword())) {
			String error = "Invalid Username or Password!";
			attr.addFlashAttribute("error", error);
			return "redirect:/login";
		}

		map.addAttribute("user", userDAO.getUserByUserName(userLogin.getUserName()));
		User thisUser = (User) map.get("user");

		return "redirect:/";
	}

////	@RequestMapping(path = "/updatePassword", method = RequestMethod.GET)
////	public String displayUpdatePasswordPage(@Valid @ModelAttribute("user") User user,@RequestParam String userName, @RequestParam String password,
////			BindingResult result, RedirectAttributes attr, ModelMap map) {
////		if (result.hasErrors()) {
////			attr.addFlashAttribute("userName", user.getUserName());
////			return "login";
////		}
////
////		userDAO.updatePassword(password, password);
////		attr.addFlashAttribute("user", user);
////		return "redirect:/login";
////	}
////	@RequestMapping(path = "/updatePassword", method = RequestMethod.POST)
////	public String displayUpdatePasswordPage(@Valid @ModelAttribute("user") User user,@RequestParam String userName, @RequestParam String password,
////			BindingResult result, RedirectAttributes attr, ModelMap map) {
////		if (result.hasErrors()) {
////			attr.addFlashAttribute("userName", user.getUserName());
////			return "login";
////		}
//
//		userDAO.updatePassword(password, password);
//		attr.addFlashAttribute("user", user);
//		return "redirect:/login";
//	}

	@RequestMapping(path = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap map, HttpSession session) {
		map.remove("user");
		session.invalidate();
		return "redirect:/";
	}
}
