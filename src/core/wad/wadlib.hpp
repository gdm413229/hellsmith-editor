
/* Hellsmith Editor : WAD Manager (Header)
 *
 * This class replaces GZDB-BF's `WAD.cs` source file.
 *
 */

#include <cstdlib> // for malloc() and free()
#include <string>


class SmithWAD_RecordList {

private:

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

~SmithWAD();
};
