package win

type IP_ADAPTER_DNS_SERVER_ADDRESS_XP struct {
	union1  ULONGLONG
	Next    *IP_ADAPTER_DNS_SERVER_ADDRESS_XP
	Address SOCKET_ADDRESS
}
