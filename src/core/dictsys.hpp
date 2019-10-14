
/* Hellsmith Editor : Dictionary System (Header) */

#include <cstdint>
#include "dataread.hpp"
#include <string>

typedef struct{
	uint64_t key_id;
	uint32_t key_hash; // Jenkins `one_at_a_time` hash makes 32-bit digests.
	std::string key_name;
	uint64_t key_size;
	std::string key_contents;
}dict_keyval;

class SmithDict {

private:

uint64_t top_index,num_indexes;

dict_keyval entries[];

void mkhash(dict_keyval* key_to_be_hashed,dict_keyval* dest);

public:

/* GOAL: Equivalent to C# System.Dictionary */

SmithDict();

~SmithDict();

dict_val read_index_signed(std::string key_name);

void write_index_signed(std::string key_name,void* key_value);

void read_index_unsigned(std::string key_name);

void write_index_unsigned(std::string key_name,void* key_value);

};
