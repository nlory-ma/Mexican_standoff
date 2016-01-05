/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Contact.class.cpp                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nlory-ma <nlory-ma@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/01/05 19:33:40 by nlory-ma          #+#    #+#             */
/*   Updated: 2016/01/05 19:33:42 by nlory-ma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "Contact.class.hpp"

Contact::Contact(void)
{
	Contact::_nbContacts++;
	if (Contact::_nbContacts == 8)
		std::cout << "enter command" << std::endl;
	return;
}

Contact::~Contact(void)
{
	if (Contact::_nbContacts == 8)
		std::cout << "contacts destroyed" << std::endl;
	Contact::_nbContacts++;
	return;
}
int Contact::_nbContacts = 0;

//


	std::string		Contact::getFirstName() const
	{
		return (this->first_name);
	}

	void			Contact::setFirstName(std::string value)
	{
		this->first_name = value;
	}

	std::string		Contact::getLastName() const
	{
		return (this->last_name);
	}

	void			Contact::setLastName(std::string value)
	{
		this->last_name = value;
	}

	std::string		Contact::getNickName() const
	{
		return (this->nickname);
	}

	void			Contact::setNickName(std::string value)
	{
		this->nickname = value;
	}

	std::string		Contact::getLogin() const
	{
		return (this->login);
	}

	void			Contact::setLogin(std::string value)
	{
		this->login = value;
	}

	std::string		Contact::getPostalAddress() const
	{
		return (this->postal_address);
	}

	void			Contact::setPostalAddress(std::string value)
	{
		this->postal_address = value;
	}


	std::string		Contact::getEmailAddress() const
	{
		return (this->email_address);
	}

	void			Contact::setEmailAddress(std::string value)
	{
		this->email_address = value;
	}

	std::string		Contact::getPhoneNumber() const
	{
		return (this->phone_number);
	}

	void			Contact::setPhoneNumber(std::string value)
	{
		this->phone_number = value;
	}

	std::string		Contact::getBirthdayDate() const
	{
		return (this->birthday_date);
	}

	void			Contact::setBirthdayDate(std::string value)
	{
		this->birthday_date = value;
	}

	std::string		Contact::getFavoriteMeal() const
	{
		return (this->favorite_meal);
	}

	void			Contact::setFavoriteMeal(std::string value)
	{
		this->favorite_meal = value;
	}

	std::string		Contact::getUnderwearColor() const
	{
		return (this->underwear_color);
	}

	void			Contact::setUnderwearColor(std::string value)
	{
		this->underwear_color = value;
	}

	std::string		Contact::getDarkestSecret() const
	{
		return (this->darkest_secret);
	}

	void			Contact::setDarkestSecret(std::string value)
	{
		this->darkest_secret = value;
	}
