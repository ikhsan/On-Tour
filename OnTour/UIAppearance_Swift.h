//
//  UIBarButtonItem+UIAppearance_Swift.h
//  OnTour
//
//  Created by Ikhsan Assaat on 6/22/15.
//  Copyright © 2015 Ikhsan Assaat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIAppearance_Swift)

+ (instancetype)sk_appearanceWhenContainedIn:(Class<UIAppearanceContainer>)containerClass;

@end



@interface UIBarButtonItem (UIAppearance_Swift)

+ (instancetype)sk_appearanceWhenContainedIn:(Class<UIAppearanceContainer>)containerClass;

@end
