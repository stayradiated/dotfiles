/* vim:set sw=4 sts=4 et: */

#include <sys/types.h>
#include <sys/ioctl.h>

#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#if defined __sun__
#include <stropts.h>
#endif
#include <unistd.h>
#include <termios.h>

int openpty(int *, int *, char *, struct termios *, struct winsize *);
int forkpty(int *, char *, struct termios *, struct winsize *);

static int
_internal_get_pty(int *master, char **path)
{
    if ((*master = open("/dev/ptmx", O_RDWR|O_NOCTTY)) == -1)
        return -1;
    if (grantpt(*master) != 0)
        return -1;
    if (unlockpt(*master) != 0)
        return -1;
    if ((*path = ptsname(*master)) == NULL)
        return -1;

    return 0;
}

static int
_internal_get_tty(int *slave, char *path,
               struct termios *termp, struct winsize *winp, int ctty)
{
    if ((*slave = open(path, O_RDWR|O_NOCTTY)) == -1)
        return -1;
#ifdef TIOCSCTTY
    if (ctty && ioctl(*slave, TIOCSCTTY, NULL) == -1)
        return -1;
#endif
#ifdef I_PUSH
    if (ioctl(*slave, I_PUSH, "ptem") == -1)
        return -1;
    if (ioctl(*slave, I_PUSH, "ldterm") == -1)
        return -1;
#if defined __sun__
    if (ioctl(*slave, I_PUSH, "ttcompat") == -1)
        return -1;
#endif
#endif

    if (termp != NULL)
        tcsetattr(*slave, TCSAFLUSH, termp);
    if (winp != NULL)
        ioctl(*slave, TIOCSWINSZ, winp);

    return 0;
}

int
openpty(int *amaster, int *aslave, char *name,
        struct termios *termp, struct winsize *winp)
{
    char *path;
    int master = -1, slave = -1;

    if (amaster == NULL || aslave == NULL)
        return -1;

    if (_internal_get_pty(&master, &path) != 0)
        goto out;
    if (_internal_get_tty(&slave, path, termp, winp, 0) != 0)
        goto out;
    if (name != NULL)
        strcpy(name, path);

    *amaster = master;
    *aslave = slave;
    return 0;

out:
    if (master != -1)
        close(master);
    if (slave != -1)
        close(slave);
    return -1;
}

int
forkpty(int *amaster, char *name,
        struct termios *termp, struct winsize *winp)
{
    char *path;
    int master = -1;
    pid_t pid;

    if (amaster == NULL)
        return -1;

    if (_internal_get_pty(&master, &path) != 0)
        goto out;
    if (name != NULL)
        strcpy(name, path);

    if ((pid = fork()) == -1)
        goto out;
    if (pid == 0) {
        int slave = -1;

        close(master);

        setsid();

        if (_internal_get_tty(&slave, path, termp, winp, 1) != 0)
            _exit(EXIT_FAILURE);

        dup2(slave, 0);
        dup2(slave, 1);
        dup2(slave, 2);
        if (slave > 2)
            close(slave);
        return 0;
    }

    *amaster = master;
    return pid;

out:
    if (master != -1)
        close(master);
    return -1;
}
