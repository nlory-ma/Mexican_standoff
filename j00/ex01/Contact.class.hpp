/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Contact.class.hpp                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nlory-ma <nlory-ma@student.42.fr>          +#+  +:+       +#+       */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/01/05 19:33:53 by nlory-ma          #+#    #+#             */
/*   Updated: 2016/01/05 19:33:54 by nlory-ma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef CONTACT_CLASS_HPP
# define CONTACT_CLASS_HPP

# include <iostream>
# include <stdio.h>
# include <string>
# include <iomanip>
# include <cstddef>

#  define MAX 8
class Contact
{

	public:
		Contact(void);
		~Contact(void);


		std::string first_name;
		std::string last_name;
		std::string nickname;
		std::string login;
		std::string postal_address;
		std::string email_address;
		std::string phone_number;
		std::string birthday_date;
		std::string favorite_meal;
		std::string underwear_color;
		std::string darkest_secret;


		public:
		void			setLastName(std::string value);
		void			setFirstName(std::string value);
		void			setNickName(std::string value);
		void			setLogin(std::string value);
		void			setPostalAddress(std::string value);
		void			setEmailAddress(std::string value);
		void			setPhoneNumber(std::string value);
		void			setBirthdayDate(std::string value);
		void			setFavoriteMeal(std::string value);
		void			setUnderwearColor(std::string value);
		void			setDarkestSecret(std::string value);

	public:
		std::string		getFirstName() const;
		std::string		getLastName() const;
		std::string		getNickName() const;
		std::string		getLogin() const;
		std::string		getPostalAddress() const;
		std::string		getEmailAddress() const;
		std::string		getPhoneNumber() const;
		std::string		getBirthdayDate() const;
		std::string		getFavoriteMeal() const;
		std::string		getUnderwearColor() const;
		std::string		getDarkestSecret() const;


	private:
			static int _nbContacts;

};


#endif