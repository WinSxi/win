package win

//ref LPVOID
//ref PENUM_PAGE_FILE_INFORMATION
//ref LPCWSTR
//ref BOOL
type PENUM_PAGE_FILE_CALLBACK func(pContext LPVOID, pPageFileInfo PENUM_PAGE_FILE_INFORMATION, lpFilename LPCWSTR) BOOL
