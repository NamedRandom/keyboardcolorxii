#import <spawn.h>
#include "keyboardcolorxiiprefsRootListController.h"

@implementation keyboardcolorxiiprefsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}


-(void)killApp {
  pid_t pid;
  int status;
  const char* args[] = {"killall", "-9", "backboardd", NULL};
  posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
  waitpid(pid, &status, WEXITED);
}


@end
