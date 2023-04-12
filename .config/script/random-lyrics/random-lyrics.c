#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/stat.h>
#include <time.h>

void get_file(char *path, int index)
{
    DIR *d;
    struct dirent *dir;
    int counter = 0;
    if (d = opendir("/home/coni/.config/random-lyrics/")) 
    {
        while ((dir = readdir(d)) != NULL) 
        {
            if (dir->d_type == DT_REG)
                {
                    if (counter == index)
                        strcat(path, dir->d_name);
                    counter++;
                }
        }
        closedir(d);
    }
}

int number_file(char *path) {

    int file_count = 0;
    DIR * dirp;
    struct dirent * entry;

    dirp = opendir(path); /* There should be error handling after this */
    while ((entry = readdir(dirp)) != NULL) {
        if (entry->d_type == DT_REG) { /* If the entry is a regular file */
            file_count++;
        }
    }
    closedir(dirp);
    return file_count;
}

void printing_slowly(char *filename, int ms)
{
    FILE *fichier; 
    char ch;
    fichier = fopen(filename,"r");
    if (fichier == NULL)
    {
        printf("ya une erreuk askip, le fichier : %s\n", filename);
        exit(1);
    }

    while ((ch = fgetc(fichier)) != EOF) {
        printf("%c",ch);
        usleep(ms);
    }
    fclose(fichier);
}

int type_file(const char *path)
{
    // 1 directory
    // 2 file
    // 0 don't exist

    struct stat path_stat;
    stat(path, &path_stat);

    if (S_ISDIR(path_stat.st_mode))
        return 1;
    else if (S_ISREG(path_stat.st_mode))
        return 2;
    else
        return 0;
}

int main(int argc, const char *argv[])
{
    char filename[255];
    int speed = 2500;

    if (argc > 2) {
        if (strcmp(argv[2], "-1") != 0)
        {
            speed = strtol(argv[2], NULL, 10);
        }
    }

    if (argc > 1) 
    {   
        int type_ = type_file(argv[1]);
        if (type_ == 1)
        {
            srand(time(NULL));
            strcpy(filename,argv[1]);
            get_file(filename, rand() % number_file(filename));
        }
        else if (type_ == 2)
        {
            strcpy(filename,argv[1]);
        }
        else
        {
            printf("%s don't exist\n", argv[1]);
            return 1;
        }

        printing_slowly(filename, speed);
        printf("\n");
    }


    return 0;
}
