release
forgetRoots
	"Tell my session to forget about my roots."
	
	roots ifNotNil: [self session removeAll: roots]