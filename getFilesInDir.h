#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <dirent.h>
#include <regex>
#include <iostream>
#include <typeinfo>
#include <sys/stat.h>
#include <time.h>
#include <string>
#include <cstring>


long mid_num(const std::string s)
{
    std::regex rgx("\\d+");
    std::smatch match;
    long i = 0;

    if (std::regex_search(s, match, rgx))
    {
        std::string str(match[0]);
        const char *ch = str.c_str();
        i = std::atol(ch);
    }

    return i;
}

void getFileDate(const std::string &s){
  // struct stat t_stat;
  // stat::stat(s, &t_stat);
  // struct tm * timeinfo = localtime(&t_stat.st_ctime); // or gmtime() depending on what you want
  // printf("File time and date: %s", asctime(timeinfo));

  // struct stat attrib;                 
  // stat(s, &attrib);   
  // struct tm * timeinfo = localtime(&attrib.st_ctime);      
  // printf("File time and date: %s", asctime(timeinfo));
}

int directorySearch (void)
{
  DIR *dp;
  int len;
  struct dirent *ep;  
  // struct stat attrib;                 
  long checkPointNumber = 0;   
  long newCheckPointNumber;   
  dp = opendir ("./cv/lua/");

  if (dp != NULL)
  {
    while ((ep = readdir(dp)))
      // getFileDate(ep->d_name);
      if(ep->d_type != DT_DIR)
      {
        len = strlen (ep->d_name);
        if (len >= 3) {
          if (strcmp (".t7", &(ep->d_name[len - 3])) == 0) {
            newCheckPointNumber = mid_num(ep->d_name);
            if(newCheckPointNumber > checkPointNumber)
            {
              checkPointNumber = newCheckPointNumber;
            }
          }
        }
      }
      std::cout << "Using checkpoint # " << checkPointNumber << '\n';

    (void) closedir (dp);
  }
  else
    perror ("Couldn't open the directory");

  return checkPointNumber;
}