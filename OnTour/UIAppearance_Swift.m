//
//  UIBarButtonItem+UIAppearance_Swift.m
//  OnTour
//
//  Created by Ikhsan Assaat on 6/22/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

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
