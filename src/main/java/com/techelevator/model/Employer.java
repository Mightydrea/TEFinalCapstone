package com.techelevator.model;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Employer {

	@NotBlank(message = "Company Name is Required")
	@Size(max = 40, message = "Maximum length is 40 characters")
	private String companyName;
	
	@NotBlank(message = "Street Address is Required")
	@Size(max = 40, message = "Maximum length is 40 characters")
	private String streetAddress1;
	
	private String streetAddress2;
	
	@NotNull(message = "Zip Code is required")
	@Pattern(regexp = "^[0-9]{5}(?:-[0-9]{4})?$", message = "Please enter a valid zip code")
	private String zipCode;
	
	@NotBlank(message = "City is Required")
	@Size(max = 40, message = "Maximum length is 40 characters")
	private String city;
	
	@NotBlank(message = "State is Required")
	@Size(max = 40, message = "Maximum length is 40 characters")
	private String state;
	
	
	private Long employerId;
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
		
	public String getStreetAddress1() {
		return streetAddress1;
	}
	public void setStreetAddress1(String streetAddress1) {
		this.streetAddress1 = streetAddress1;
	}
	public String getStreetAddress2() {
		return streetAddress2;
	}
	public void setStreetAddress2(String streetAddress2) {
		this.streetAddress2 = streetAddress2;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Long getEmployerId() {
		return employerId;
	}
	public void setEmployerId(Long employerId) {
		this.employerId = employerId;
	}
	

	
}
