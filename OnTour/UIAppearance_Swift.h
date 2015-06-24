
#import <UIKit/UIKit.h>

@interface UIView (UIAppearance_Swift)

+ (instancetype)sk_appearanceWhenContainedIn:(Class<UIAppearanceContainer>)containerClass;

@end



@interface UIBarButtonItem (UIAppearance_Swift)

+ (instancetype)sk_appearanceWhenContainedIn:(Class<UIAppearanceContainer>)containerClass;

@end
