#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>


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
    char filename[100];
    int speed = 2500;

    if (argc > 1) {
        if (strcmp(argv[1], "-1") != 0)
        {
            speed = strtol(argv[1], NULL, 10);
        }
    }

    if (argc > 2) 
    {   
        int type_ = type_file(argv[2]);
        if (type_ == 1)
        {
            strcpy(filename,argv[2]);
            char c_random_file[] = " ";
            int count = number_file(filename);
            int i_random_file = rand() % count;
            sprintf(c_random_file, "%d", i_random_file);
            strcat(filename,c_random_file);
        }
        else if (type_ == 2)
        {
            strcpy(filename,argv[2]);
        }
        else
        {
            printf("%s don't exist\n", argv[2]);
            return 1;
        }


    } else {
        strcpy(filename,"/etc/coni/lyrics/");
        char c_random_file[] = " ";
        int count = number_file(filename);
        int i_random_file = rand() % count;
        sprintf(c_random_file, "%d", i_random_file);
        strcat(filename,c_random_file);
    }

    printing_slowly(filename, speed);
    printf("\n");

    return 0;
}
