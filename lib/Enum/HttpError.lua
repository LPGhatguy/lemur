local createEnum = import("../createEnum")

return createEnum("HttpError", {
	OK = 0,
	InvalidUrl = 1,
	DnsResolve = 2,
	ConnectFail = 3,
	OutOfMemory = 4,
	TimedOut = 5,
	TooManyRedirects = 6,
	InvalidRedirect = 7,
	NetFail = 8,
	Aborted = 9,
	SslConnectFail = 10,
	Unknown = 11,
})
