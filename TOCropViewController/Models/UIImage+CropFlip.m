//
//  UIImage+CropFlip.m
//  Pods
//
//  Created by Kevin Cao on 7/11/15.
//
//

#import "UIImage+CropFlip.h"

@implementation UIImage (CropFlip)


- (UIImage *)CropFlipImageByAxis:(int)axis {
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if(axis == MVImageFlipXAxis){
        // Do nothing, X is flipped normally in a Core Graphics Context
    } else if(axis == MVImageFlipYAxis){
        // fix X axis
        CGContextTranslateCTM(context, 0, self.size.height);
        CGContextScaleCTM(context, 1.0f, -1.0f);
        
        // then flip Y axis
        CGContextTranslateCTM(context, self.size.width, 0);
        CGContextScaleCTM(context, -1.0f, 1.0f);
    } else if(axis == MVImageFlipXAxisAndYAxis){
        // just flip Y
        CGContextTranslateCTM(context, self.size.width, 0);
        CGContextScaleCTM(context, -1.0f, 1.0f);
    }
    
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *flipedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return flipedImage;
}

@end
