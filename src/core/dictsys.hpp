
/* Hellsmith Editor : Dictionary System (Header) */

#include <cstdint>
#include "dataread.hpp"
#include <string>

typedef struct{
	uint64_t key_id;
	std::string key_name;
	uint64_t key_size;
	std::string key_contents;
}
 dict_keyval;

class SmithDict {

private:

uint64_t top_index,num_indexes;

dict_keyval[] entries;

public:

/* GOAL: Equivalent to C# System.Dictionary */

SmithDict();

~SmithDict();

dict_val read_index_signed(std::string key_name);

void write_index_signed();

void read_index_unsigned();

void write_index_unsigned();

};
