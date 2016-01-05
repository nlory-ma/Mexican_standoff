/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   megaphone.cpp                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nlory-ma <nlory-ma@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/01/05 18:26:04 by nlory-ma          #+#    #+#             */
/*   Updated: 2016/01/05 18:26:07 by nlory-ma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>

char		*ft_capitalize(char *s)
{
	int		i;

	i = 0;
	while (s[i] != 0)
	{
		if (s[i] >= 'a' && s[i] <= 'z')
			s[i] = s[i] - 32;
		i++;
	}
	return (s);
}

void		ft_megaphone(char **av)
{
	int		i;

	i = 1;
	while (av[i] != NULL)
	{
		std::cout << ft_capitalize(av[i]);
		i++;
	}
	std::cout << std::endl;
}

int			main(int ac, char **av)
{
	if (ac == 1)
		std::cout << "* LOUD AND UNBEARABLE FEEDBACK NOISE *" << std::endl;
	else
		ft_megaphone(av);
	return (0);
}