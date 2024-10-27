ifeq ($(OS), Windows_NT)
	DIRSEP	= \\
	CP		= copy
	RM		= del -f
else
	DIRSEP	= /
	CP		= cp
	RM		= rm -f
endif

NAME		= libftprintf.a

SRCS		= ft_itoa.c \
				ft_strlen.c \
				ft_printf.c \
				ft_printf_param.c \
				ft_itoa.c \
				ft_printf_char.c \
				ft_printf_decimal.c \
				ft_printf_unsigned_decimal.c \
				ft_printf_hex_address.c \
				ft_printf_string.c \
				ft_putnbr_base.c \
				ft_strlen.c

OBJS		= $(addprefix srcs${DIRSEP}, ${SRCS:%.c=%.o})

CC			= cc

HEAD		= header

CFLAGS		= -Wall -Wextra -Werror -I ${HEAD}

%.o : %.c
	${CC} ${CFLAGS} -o $@ -c $<

${NAME}: ${OBJS} ${HEAD}
	ar crs ${NAME} ${OBJS}

all: ${NAME}

clean: 
	${RM} ${OBJS}

fclean: clean
	${RM} ${NAME}

re: fclean all

debug:
	cc -g ${CFLAGS} srcs/*.c

.PHONY: all clean fclean re