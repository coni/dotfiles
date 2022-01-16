#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char* argv[]) 
{
    FILE *fp;
    char buff[255];
    char text[255];
    int type = 0;

    if (argc > 1)
    {
        if (strcmp("status",argv[1]) == 0)
        {
            type = 1;
        }
    }

    if (type == 0)
    {
        int now;
        int total;
        int percent;

        fp = fopen("/sys/class/power_supply/BAT0/charge_now", "r");
        fgets(buff, 255, (FILE*)fp);
        now = atoi(buff);
        fclose(fp);

        fp = fopen("/sys/class/power_supply/BAT0/charge_full", "r");
        fgets(buff, 255, (FILE*)fp);
        total = atoi(buff);
        fclose(fp);
        percent=now*100/total;
        sprintf(text, "%d", percent);
    } else
    {
        int charging = 1;
        fp = fopen("/sys/class/power_supply/BAT0/status", "r");
        fgets(buff, 255, (FILE*)fp);
        if (strcmp("Discharging\n", buff) == 0)
        {
            charging = 0;
        }
        fclose(fp);
        sprintf(text, "%d", charging);
    }
    printf("%s\n",text);
}