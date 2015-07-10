//
//  UIImage+CropFlip.h
//  Pods
//
//  Created by Kevin Cao on 7/11/15.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (CropFlip)

enum MVImageFlip {
    MVImageFlipXAxis,
    MVImageFlipYAxis,
    MVImageFlipXAxisAndYAxis,
} ;

- (UIImage*) CropFlipImageByAxis:(int)axis ;

@end
