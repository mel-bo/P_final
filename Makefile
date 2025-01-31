# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mel-bout <mel-bout@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/28 15:26:33 by mel-bout          #+#    #+#              #
#    Updated: 2024/12/15 21:28:18 by mel-bout         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
INC = -Llibft -lft -Lft_printf -lftprintf 
CFLAGS = -Wall -Werror -Wextra -I libft -I ft_printf -g
 
SRCS =  main.c check_arg.c push_swap_utils.c algo.c algo_utils.c \
		swap.c rotate.c rev_rotate.c \
		push.c algo_init.c algo_exe.c

# transforme tt les .c en .o
OBJS = ${SRCS:.c=.o}

NAME = push_swap

# on call all avec make
all: ${NAME}

${NAME}: ${OBJS}
	@make -C libft
	@make -C ft_printf
	@${CC} ${CFLAGS} ${OBJS} -o ${NAME} ${INC}

clean:
	@make clean -C libft
	@make clean -C ft_printf
	@${RM} ${OBJS}
	

fclean: clean
	@make fclean -C libft
	@make fclean -C ft_printf
	@${RM} ${NAME}

re: fclean all

.PHONY: all clean fclean re