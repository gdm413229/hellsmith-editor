
/* Hellsmith Editor : WAD Manager (Source)
 *
 * This class replaces GZDB-BF's `WAD.cs` source file.
 *
 */

#include "wadlib.hpp"

SmithWAD_RecordList::SmithWAD_RecordList() {
  // TODO: code suitable ctor
}

SmithWAD_RecordList::~SmithWAD_RecordList() {
  // TODO: code suitable dtor
}

// Above this comment is the record list stuff and below is the overall WAD stuff.

SmithWAD::SmithWAD() {
  this.record_list = new SmithWAD_RecordList();
}

SmithWAD::~SmithWAD() {
  delete this.record_list;
}
