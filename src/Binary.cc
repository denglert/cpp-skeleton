#include "Binary.h"

int main(int argc, const char *argv[] ) 
{

	if (argc != 3)
	{
		std::cerr << "Usage: ./binary <var1> <var2> " << std::endl;
		exit(1);
	}
	
	std::string var1 = argv[1];
	std::string var2 = argv[2];

	std::cout << std::endl;
	std::cout << "Binary program started." << std::endl;
	std::cout << std::endl;
	std::cout << "variable1: " << var1 << std::endl;
	std::cout << "variable2: " << var2 << std::endl;
	std::cout << std::endl;
	
	return 0;

}
