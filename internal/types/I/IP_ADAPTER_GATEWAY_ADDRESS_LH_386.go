package win

type IP_ADAPTER_GATEWAY_ADDRESS_LH struct {
	union1   ULONGLONG
	Next     *IP_ADAPTER_GATEWAY_ADDRESS_LH
	Address  SOCKET_ADDRESS
	padding1 [4]byte
}
