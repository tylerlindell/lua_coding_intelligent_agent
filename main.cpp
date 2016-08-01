#include <stdio.h>
#include <iostream>
#include <string>
#include "getFilesInDir.h"

#include "lua.hpp"


using namespace std;


/* the Lua interpreter */
lua_State* L;

int testRnn ( long checkpoint, std::string x )
{
	int sum = 0;
	const char * c = x.c_str();
	std::string checkpointStr = to_string(checkpoint);
	const char * checkpointCStr = checkpointStr.c_str();

	/* the function name */
	lua_getglobal(L, "add");

	// /* the first argument */
	lua_pushfstring (L, checkpointCStr);

	// /* the second argument */
	lua_pushfstring (L, c);

	// /* call the function with 2 arguments, return 1 result */
	lua_call(L, 2, 1);

	return sum;
}


int main()
{
	long checkpoint = directorySearch();
	std::string line;
	const char * a = line.c_str();

	L = luaL_newstate();
    luaL_openlibs(L);
    luaL_dofile(L, "sample.lua");


	do{
		printf("%s", "hey, enter a number for 'line': ");
		std::getline(std::cin, line);
		if(line != "")
		{
			testRnn( checkpoint, line );
		}
		a = line.c_str();
	}while(strlen(a) < 500);
	
	/* cleanup Lua */
	lua_close(L);

	/* pause */
	getchar();


	return 0;
}