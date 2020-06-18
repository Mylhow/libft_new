#ifndef LIBFT_LIST_H
# define LIBFT_LIST_H
# include "libft.h"

typedef struct	s_list
{
	void			*content;
	struct s_list	*next;
}				t_list;

void			ft_lstadd_back(t_list **alst, t_list *enew);
void			ft_lstadd_front(t_list **alst, t_list *enew);
void			ft_lstdelone(t_list *lst, void (*del)(void *));
void			ft_lstclear(t_list **lst, void (*del)(void *));
void			ft_lstiter(t_list *lst, void (*f)(void *));
t_list			*ft_lstlast(t_list *lst);
#endif