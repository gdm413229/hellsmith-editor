
/* Hellsmith Editor : WAD Manager (Header)
 *
 * This class replaces GZDB-BF's `WAD.cs` source file.
 *
 */

#include <cstdlib> // for malloc() and free()
#include <string>


class SmithWAD_Record {
	private:
	
	bool record_dirty; // if true, we known that record needs to be saved.
	
	public:
	
	/* The func below answers the `is this record dirty?`
	 * question. */
	
	bool GetDirtyStatus();
	
	SmithWAD_Record();
	
	~SmithWAD_Record();
};

class SmithWAD_RecordList {

private:

bool isdisposed;

public:

SmithWAD_RecordList(); // declare the ctor

~SmithWAD_RecordList(); // ditto but for dtor

};

class SmithWAD {

private:
SmithWAD_RecordList record_list;

public:

bool isIWAD,isOfficialIWAD,dirty,readonly;
std::string filename;

SmithWAD();

// GOAL: code equivalent to GZDB-BF's `WADReader` class as overload ctor
SmithWAD(std::string inputname);

~SmithWAD();
};
