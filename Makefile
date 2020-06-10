.PHONY: all clean fclean re

# Name of file
NAME		=	libft

# Name directory
PATH_INC	=	includes
PATH_SRC	=	srcs
PATH_OBJ	=	objs
PATH_LOG	=	logs

# List of sources
SRCS_string	=	string/ft_strlen.c
OBJS		=	$(addprefix $(PATH_OBJ)/, $(SRCS_string:.c=.o))
INCS		=	$(addprefix $(PATH_INC)/, libft.h)
LOG			=	$(addprefix $(PATH_LOG)/, $(NAME).log)

# Commands of compilation
COMP		=	clang
COMP_FLAG	=	-Wall -Werror -Wextra
COMP_ADD	=	-I$(PATH_INC)

# Others Command
RM			=	/bin/rm

# Color Code and template code
_YELLOW		=	\e[38;5;184m
_GREEN		=	\e[38;5;46m
_RESET		=	\e[0m
_INFO		=	[$(_YELLOW)INFO$(_RESET)]
_SUCCESS	=	[$(_GREEN)SUCCESS$(_RESET)]

# Functions
all:	init $(NAME)
	@ echo "$(_SUCCESS) Compilation done"

init:
	@ echo "$(_INFO) Initialize $(NAME)"
	@ $(shell mkdir -p $(PATH_OBJ) $(PATH_LOG) $(addprefix $(PATH_OBJ)/,\
	string))

$(NAME): $(OBJS) $(INCS)
	@ (set -x; ar rcs $(NAME).a $(OBJS)) >> $(LOG) 2>&1

$(PATH_OBJ)/%.o: $(PATH_SRC)/%.c $(INCS)
	@ (set -x; $(COMP) $(COMP_FLAG) $(COMP_ADD) -c $< -o $@) >> $(LOG) 2>&1
	@ echo "$(_INFO) Compilation of $*"

clean:
	@ $(RM) -rf $(PATH_OBJ)
	@ echo "$(_INFO) Deleted files and directory"

fclean: clean
	@ $(RM) -rf $(NAME).a
	@ $(RM) -rf $(PATH_LOG)

re: fclean all

run: $(NAME)
	@ (set -x; $(COMP) $(COMP_FLAG) $(COMP_ADD) main.c -L. -lft) >> $(LOG) 2>&1