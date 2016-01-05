/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nlory-ma <nlory-ma@student.42.fr>          +#+  +:+       +#+       */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/01/05 19:09:14 by nlory-ma          #+#    #+#             */
/*   Updated: 2016/01/05 19:09:17 by nlory-ma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "Contact.class.hpp"


static 				void current_contact(Contact *contacts)
{
	int 			nb;
	std::cout << "index : ";
	std::cin >> nb;
	std::cout << std::endl;
	if (std::cin.fail())
	{
		std::cin.clear();
		std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		nb = 32;
	}
	std::cout << "first name: " << contacts[nb].first_name << std::endl;
	std::cout << "last name: " << contacts[nb].last_name << std::endl;
	std::cout << "nickname: " << contacts[nb].nickname << std::endl;
	std::cout << "login: " << contacts[nb].login << std::endl;
	std::cout << "postal adress: " << contacts[nb].postal_address << std::endl;
	std::cout << "email adress: " << contacts[nb].email_address << std::endl;
	std::cout << "phone number: " << contacts[nb].phone_number << std::endl;
	std::cout << "birthday date: " << contacts[nb].birthday_date << std::endl;
	std::cout << "favorite meal: " << contacts[nb].favorite_meal << std::endl;
	std::cout << "underwear color: " << contacts[nb].underwear_color << std::endl;
	std::cout << "darkest secret: " << contacts[nb].darkest_secret << std::endl;
	std::cout << "Enter a command" << std::endl;
}

static 			void list_contacts(Contact *contacts)
{
	int i = 0;

	std::cout << std::right << std::setw(10) << "index" << " | ";
	std::cout << std::right << std::setw(10) << "first name" << " | ";
	std::cout << std::right << std::setw(10) << "last name" << " | ";
	std::cout << std::right << std::setw(10) << "nickname" << std::endl;
	while (i < 8)
	{
			std::cout << std::right << std::setw(10) << i << " | ";
			if (contacts[i].first_name.length() > 10)
				std::cout << std::right << std::setw(10) << contacts[i].first_name.substr(0, 9).append(".")<< " | ";	
			else
				std::cout << std::right << std::setw(10) << contacts[i].first_name.substr(0, 10) << " | ";
			
			if (contacts[i].last_name.length() > 10)
				std::cout << std::right << std::setw(10) << contacts[i].last_name.substr(0, 9).append(".") <<" | ";
			else
				std::cout << std::right << std::setw(10) << contacts[i].last_name.substr(0, 10) << " | ";
			
			if (contacts[i].nickname.length() > 10)
				std::cout << std::right << std::setw(10) << contacts[i].nickname.substr(0, 9).append(".") << std::endl;
			else
				std::cout << std::right << std::setw(10) << contacts[i].nickname.substr(0, 10) << std::endl;
		i++;
	}
	return ;
}

int 		ft_nbr_contact(Contact *contacts)
{
	int			i;

	i = 0;
	while (i < MAX && contacts[i].getFirstName() != std::string(""))
		i++;
	if (i >= MAX)
	{
		std::cout << "Contact list is full. NO MORE THAN 8 CONTACTS" << std::endl;
		exit (0);
	}
	return (i);
}

void			ft_exit(std::string buffer)
{
	if (buffer == std::string("EXIT"))
		exit (0);
}

void			ft_add(Contact *contacts)
{
	int			i;
	std::string buffer;

			i = ft_nbr_contact(contacts);

			std::cout << "User [" << i + 1 << "]" << std::endl;
			std::cout << "new contact first name :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setFirstName(buffer);

			std::cout << "new contact last name :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setLastName(buffer);

			std::cout << "new contact nickname name :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setNickName(buffer);

			std::cout << "new contact login name :  " ;
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setLogin(buffer);
			
			std::cout << "new contact postal_address :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setPostalAddress(buffer);

			std::cout << "new contact email_address :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setEmailAddress(buffer);

			std::cout << "new contact phone_number :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setPhoneNumber(buffer);

			std::cout << "new contact birthday_date :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setBirthdayDate(buffer);

			std::cout << "new contact favorite_meal :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setFavoriteMeal(buffer);

			std::cout << "new contact underwear_color :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setUnderwearColor(buffer);

			std::cout << "new contact darkest_secret :  ";
			std::cin >> buffer;
			ft_exit(buffer);
			contacts[i].setDarkestSecret(buffer);
			std::cout << "Enter a command" << std::endl;
}

void			do_something(std::string buffer, Contact *contacts)
{	
	if (buffer == std::string("ADD"))
		ft_add(contacts);

	else if (buffer == "SEARCH")
	{
		list_contacts(contacts);
		current_contact(contacts);
	}
	else
		std::cout << "UNKNOWN COMMAND" << std::endl;
}

int 			main(void)
{
	std::string buffer;
	Contact contacts[MAX];
	
	std::cin >> buffer;

	while (buffer != std::string("EXIT") && !std::cin.eof())
	{
		do_something(buffer, contacts);
		std::cin >> buffer;
	}
	exit(0);
}

