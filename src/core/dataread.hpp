
/* Hellsmith Editor : Data Reader and Writer (Header) */

#include <iostream>
#include <string>
#include <cstdint>

/* These additional macros are set in stone for compatibility
 * with older (pre-C++11) C++ std libs. */

#define BEGIN(buffer) buffer
#define END(buffer) (buffer + sizeof(buffer)/sizeof(buffer[0]))

class SmithDataReader {
	private:
	
	size_t buffer_size;
	
	uint8_t* buffer_data;
	
	inline size_t calculate_bufsize(){
		return END(*this.buffer_data) - BEGIN(*this.buffer_data);
	}
	
	public:
	
	SmithDataReader();
	
	~SmithDataReader();
};
