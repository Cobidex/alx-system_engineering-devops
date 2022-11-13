#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * infinite_while - infinite loop
 * Return: void
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - creates 5 child processes
 * Descriptiion: creates child process using fork sys call
 * Return: 0 if success
 */
int main(void)
{
	int i;
	pid_t pid;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid > 0)
		{
			printf("Zombie process created, PID: %i\n", pid);
		}
		else
			exit(0);
	}
	return (infinite_while());
}
