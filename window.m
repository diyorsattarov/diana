#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    // Create an autorelease pool for memory management
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // Initialize the application
    [NSApplication sharedApplication];
    
    // Set up the application as a GUI app
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
    
    // Create the main window
    NSRect windowRect = NSMakeRect(100, 100, 400, 300);
    NSWindow *window = [[NSWindow alloc]
        initWithContentRect:windowRect
        styleMask:NSWindowStyleMaskTitled |
                 NSWindowStyleMaskClosable |
                 NSWindowStyleMaskMiniaturizable |
                 NSWindowStyleMaskResizable
        backing:NSBackingStoreBuffered
        defer:NO];
    
    // Set window properties
    [window setTitle:@"My Window"];
    [window setBackgroundColor:[NSColor whiteColor]];
    [window makeKeyAndOrderFront:nil];
    
    // Create and set the menu bar
    NSMenu *menubar = [[NSMenu alloc] init];
    NSMenuItem *appMenuItem = [[NSMenuItem alloc] init];
    [menubar addItem:appMenuItem];
    [NSApp setMainMenu:menubar];
    
    NSMenu *appMenu = [[NSMenu alloc] init];
    NSMenuItem *quitMenuItem = [[NSMenuItem alloc]
        initWithTitle:@"Quit"
        action:@selector(terminate:)
        keyEquivalent:@"q"];
    [appMenu addItem:quitMenuItem];
    [appMenuItem setSubmenu:appMenu];
    
    // Activate the application
    [NSApp activateIgnoringOtherApps:YES];
    
    // Start the event loop
    [NSApp run];
    
    [pool drain];
    return 0;
}
