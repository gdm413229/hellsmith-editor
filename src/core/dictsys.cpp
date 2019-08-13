
/* Hellsmith Editor : Dictionary System (Source) */

#include "dictsys.hpp"

SmithDict::SmithDict() {
  // TODO: code suitable ctor
}

void SmithDict::read_index_signed(std::string key_name){
	return *this.;
}

void SmithDict::read_index_unsigned(std::string key_name){
	
}

void write_index_signed(std::string key_name,void* key_value){
	
}


void write_index_unsigned(std::string key_name,void* key_value){
	
}

void SmithDict::mkhash(dict_keyval* key_to_be_hashed,dict_keyval* dest){
	
	/* SYNOPSIS: mkhash(&key_to_be_hashed,&dest);
	 * Implements the Jenkins `one_at_a_time` hash algo */
	
	dict_keyval source = *key_to_be_hashed;
	dict_keyval returnme=source; // Copy src key to returnme as we need it later.
	uint32_t hash_tmp=0;
	
	uint64_t hashpos=0;
	
	while(hashpos != source.key_size) {
		hash_tmp += source.key_contents.c_str[hashpos++];
		hash_tmp += hash_tmp << 10;
		hash_tmp ^= hash_tmp >> 6;
	}
	hash_tmp += hash_tmp << 3;
	hash_tmp ^= hash_tmp >> 11;
	hash_tmp += hash_tmp << 15;
	returnme.key_hash = hash_tmp; *dest=returnme; // return calculated hash to destination
}

SmithDict::~SmithDict() {
  // TODO: code suitable dtor
}
