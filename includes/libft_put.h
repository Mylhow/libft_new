#ifndef LIBFT_PUT_H
# define LIBFT_PUT_H

#include "libft.h"
#include <unistd.h>

void	ft_putchar(char c);
void	ft_putchar_fd(char c, int fd);
void	ft_putnchar(char c, int n);
void	ft_putnchar_fd(char c, int n, int fd);
void	ft_putstr(char *c);
void	ft_putstr_fd(char *c, int fd);
#endif