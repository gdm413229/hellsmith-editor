
/* Hellsmith Editor : WAD Manager (Source)
 *
 * This class replaces GZDB-BF's `WAD.cs` source file.
 *
 */

#include "wadlib.hpp"

bool SmithWAD_RecordList::GetDirtyStatus() {
	return this.record_dirty;
	}

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

SmithWAD::SmithWAD(std::string inputname) {
  this.record_list = new SmithWAD_RecordList();
}

SmithWAD::~SmithWAD() {
  /* check if the WAD is dirty.
   * ALGORITHM:
   * CALL
   *   if this file isn't dirty
   *   END
   *   if this file is dirty
   *   open dialog for where to write the WAD file
   *   write the WAD
   * END
   *  */
  if(this.dirty) {
	  
	  }
  delete this.record_list;
}
