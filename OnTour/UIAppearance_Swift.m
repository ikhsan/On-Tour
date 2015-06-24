
#import "UIAppearance_Swift.h"

@implementation UIView (UIAppearance_Swift)

+ (instancetype)sk_appearanceWhenContainedIn:(Class<UIAppearanceContainer>)containerClass {
    return [self appearanceWhenContainedIn:containerClass, nil];
}

@end

@implementation UIBarButtonItem (UIAppearance_Swift)

+ (instancetype)sk_appearanceWhenContainedIn:(Class<UIAppearanceContainer>)containerClass {
    return [self appearanceWhenContainedIn:containerClass, nil];
}

@end
