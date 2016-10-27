package win

//ref CS_TYPE_NET_SIZE_ROUTINE
//ref CS_TYPE_TO_NETCS_ROUTINE
//ref CS_TYPE_LOCAL_SIZE_ROUTINE
//ref CS_TYPE_FROM_NETCS_ROUTINE
type NDR_CS_SIZE_CONVERT_ROUTINES struct {
	PfnNetSize   uintptr // CS_TYPE_NET_SIZE_ROUTINE
	PfnToNetCs   uintptr // CS_TYPE_TO_NETCS_ROUTINE
	PfnLocalSize uintptr // CS_TYPE_LOCAL_SIZE_ROUTINE
	PfnFromNetCs uintptr // CS_TYPE_FROM_NETCS_ROUTINE
}
