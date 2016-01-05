# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nlory-ma <nlory-ma@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/01/05 19:06:54 by nlory-ma          #+#    #+#              #
#    Updated: 2016/01/05 19:06:59 by nlory-ma         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = contact

SRC = Contact.class.cpp \
	  main.cpp 

OBJ = $(SRC:%.cpp=%.o)

FLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJ)
	clang++ $(FLAGS) $(SRC) -o $(NAME) 

%.o: %.cpp
	clang++ $(FLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
