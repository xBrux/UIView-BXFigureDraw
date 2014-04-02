//
//  BRUXUIView+FigureDraw.m
//  FigureDraw
//
//  Created by BRUX on 14-2-21.
//  Copyright (c) 2014年 BRUX All rights reserved.
//

#define PI 3.1415926535
#import <QuartzCore/QuartzCore.h>
#import "UIView+BXFigureDraw.h"

@implementation UIView (FigureDraw)

-(UIImage *)BXSnap
{
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)BXDrawRoundedRectangle:(CGRect)rect
                       radius:(float)radius
                  drawingMode:(CGPathDrawingMode)drawingMode
{
    CGContextRef context     = UIGraphicsGetCurrentContext();

    CGMutablePathRef pathRef = [self pathWithFrame:rect withRadius:radius];

    CGContextAddPath(context, pathRef);

    CGContextDrawPath(context,drawingMode);

    CGPathRelease(pathRef);
}

-(UIImage *)BXRoundedRectangleImage:(CGSize)size
                             radius:(float)radius
                        drawingMode:(CGPathDrawingMode)drawingMode
                              color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect          = CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, color.CGColor);

    [self BXDrawRoundedRectangle:rect
                          radius:radius
                     drawingMode:drawingMode];

    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return image;
}

-(void)BXDrawRectangle:(CGRect)rect
           drawingMode:(CGPathDrawingMode)drawingMode
{
    CGContextRef context     = UIGraphicsGetCurrentContext();

    CGMutablePathRef pathRef = [self pathWithFrame:rect withRadius:0];

    CGContextAddPath(context, pathRef);

    CGContextDrawPath(context,drawingMode);

    CGPathRelease(pathRef);
}

-(UIImage *)BXRectangleImage:(CGSize)size
                 drawingMode:(CGPathDrawingMode)drawingMode
                       color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect          = CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, color.CGColor);

    [self BXDrawRectangle:rect drawingMode:drawingMode];

    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return image;
}

-(void)BXDrawPolygon:(NSArray *)pointValues
         drawingMode:(CGPathDrawingMode)drawingMode
{
    if(pointValues.count<3)
        return;
    for (int i = 0; i<pointValues.count; i++) {
        if (![[pointValues[i] class] isSubclassOfClass:[NSValue class]])
            return;
    }

    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    NSValue *startPointValue = pointValues[0];
    CGPoint  startPoint      = [startPointValue CGPointValue];
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    
    for (int i = 1; i < pointValues.count; i++)
    {
        NSValue *pointValue = pointValues[i];
        CGPoint  point      = [pointValue CGPointValue];
        CGContextAddLineToPoint(context, point.x,point.y);
    }
    
    CGContextClosePath(context);
    CGContextDrawPath(context, drawingMode);
}

-(UIImage *)BXPolygonImage:(NSArray *)pointValues
                      size:(CGSize)size
               drawingMode:(CGPathDrawingMode)drawingMode
                     color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    [self BXDrawPolygon:pointValues drawingMode:drawingMode];
    
    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)BXDrawCircleWithCenter:(CGPoint)center
                       radius:(float)radius
                  drawingMode:(CGPathDrawingMode)drawingMode
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGPathAddArc(pathRef,
                 &CGAffineTransformIdentity,
                 center.x,
                 center.y,
                 radius,
                 -PI/2,
                 radius*2*PI-PI/2,
                 NO);
    CGPathCloseSubpath(pathRef);
    
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context,drawingMode);
    
    CGPathRelease(pathRef);
}

-(UIImage *)BXCircleImageWithCenter:(CGPoint)center
                             radius:(float)radius
                               size:(CGSize)size
                        drawingMode:(CGPathDrawingMode)drawingMode
                              color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    [self BXDrawCircleWithCenter:center radius:radius drawingMode:drawingMode];
    
    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)BXDrawSectorFromCenter:(CGPoint)center
                       radius:(float)radius
                   startAngle:(float)startAngle
                     endAngle:(float)endAngle
                    clockwise:(BOOL)clockwise
                  drawingMode:(CGPathDrawingMode)drawingMode
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    
    CGContextMoveToPoint(context, center.x, center.y);
    
    CGContextAddArc(context,
                    center.x,
                    center.y,
                    radius,
                    startAngle,
                    endAngle,
                    clockwise?0:1);
    CGContextClosePath(context);
    CGContextDrawPath(context,drawingMode);
}

-(UIImage *)BXSectorImageFromCenter:(CGPoint)center
                             radius:(float)radius
                         startAngle:(float)startAngle
                           endAngle:(float)endAngle
                          clockwise:(BOOL)clockwise
                               size:(CGSize)size
                        drawingMode:(CGPathDrawingMode)drawingMode
                              color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    [self BXDrawSectorFromCenter:center
                          radius:radius
                      startAngle:startAngle
                        endAngle:endAngle
                       clockwise:clockwise
                     drawingMode:drawingMode];
    
    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)BXDrawLineFrom:(CGPoint)startPoint to:(CGPoint)endPoint
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x,endPoint.y);
    
    CGContextStrokePath(context);
}

-(UIImage *)BXLineImageFrom:(CGPoint)startPoint to:(CGPoint)endPoint size:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    [self BXDrawLineFrom:startPoint to:endPoint];
    
    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;

}

-(void)BXDrawLines:(NSArray *)pointValues
{
    if(pointValues.count<2)
        return;
    for (int i = 0; i<pointValues.count; i++) {
        if (![[pointValues[i] class] isSubclassOfClass:[NSValue class]])
            return;
    }
    
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    NSValue *startPointValue = pointValues[0];
    CGPoint  startPoint      = [startPointValue CGPointValue];
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    
    for(int i = 1;i<pointValues.count;i++)
    {
        NSValue *pointValue = pointValues[i];
        CGPoint  point      = [pointValue CGPointValue];
        CGContextAddLineToPoint(context, point.x,point.y);
    }
    
    CGContextStrokePath(context);
}

-(UIImage *)BXLinesImage:(NSArray *)pointValues size:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    [self BXDrawLines:pointValues];
    
    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)BXDrawQuadCurveFrom:(CGPoint)startPoint to:(CGPoint)endPoint ControlPoint:(CGPoint)controlPoint
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddQuadCurveToPoint(context,
                                 controlPoint.x,
                                 controlPoint.y,
                                 endPoint.x,
                                 endPoint.y);
    
    CGContextDrawPath(context,kCGPathStroke);
}

-(UIImage *)BXQuadCurveImageFrom:(CGPoint)startPoint to:(CGPoint)endPoint ControlPoint:(CGPoint)controlPoint size:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    [self BXDrawQuadCurveFrom:startPoint to:endPoint ControlPoint:controlPoint];
    
    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;

}

-(void)BXDrawCurveFrom:(CGPoint)startPoint to:(CGPoint)endPoint firstControlPoint:(CGPoint)firstControlPoint secondControlPoint:(CGPoint)secondControlPoint
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddCurveToPoint(context,
                             firstControlPoint.x,
                             firstControlPoint.y,
                             secondControlPoint.x,
                             secondControlPoint.y,
                             endPoint.x,
                             endPoint.y);
    
    CGContextDrawPath(context,kCGPathStroke);
}

-(UIImage *)BXCurveImageFrom:(CGPoint)startPoint to:(CGPoint)endPoint firstControlPoint:(CGPoint)firstControlPoint secondControlPoint:(CGPoint)secondControlPoint size:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    [self BXDrawCurveFrom:startPoint to:endPoint firstControlPoint:firstControlPoint secondControlPoint:secondControlPoint];
    
    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;

}

-(void)BXDrawArcFromCenter:(CGPoint)center radius:(float)radius startAngle:(float)startAngle endAngle:(float)endAngle clockwise:(BOOL)clockwise
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(context,
                    center.x,
                    center.y,
                    radius,
                    startAngle,
                    endAngle,
                    clockwise?0:1);
    
    CGContextStrokePath(context);
}

-(UIImage *)BXArcImageFromCenter:(CGPoint)center radius:(float)radius startAngle:(float)startAngle endAngle:(float)endAngle clockwise:(BOOL)clockwise size:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    [self BXDrawArcFromCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    
    UIImage* image       = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;

}

-(CGMutablePathRef)pathWithFrame:(CGRect)frame withRadius:(float)radius
{
    CGPoint x1,x2,x3,x4; //x为4个顶点
    CGPoint y1,y2,y3,y4,y5,y6,y7,y8; //y为4个控制点
    //从左上角顶点开始，顺时针旋转,x1->y1->y2->x2
    
    x1 = frame.origin;
    x2 = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y);
    x3 = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y+frame.size.height);
    x4 = CGPointMake(frame.origin.x                 , frame.origin.y+frame.size.height);
    
    
    y1 = CGPointMake(frame.origin.x+radius, frame.origin.y);
    y2 = CGPointMake(frame.origin.x+frame.size.width-radius, frame.origin.y);
    y3 = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y+radius);
    y4 = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y+frame.size.height-radius);
    
    y5 = CGPointMake(frame.origin.x+frame.size.width-radius, frame.origin.y+frame.size.height);
    y6 = CGPointMake(frame.origin.x+radius, frame.origin.y+frame.size.height);
    y7 = CGPointMake(frame.origin.x, frame.origin.y+frame.size.height-radius);
    y8 = CGPointMake(frame.origin.x, frame.origin.y+radius);
    
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    if (radius<=0) {
        CGPathMoveToPoint(pathRef,    &CGAffineTransformIdentity, x1.x,x1.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x2.x,x2.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x3.x,x3.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x4.x,x4.y);
    }else
    {
        CGPathMoveToPoint(pathRef,    &CGAffineTransformIdentity, y1.x,y1.y);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y2.x,y2.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x2.x,x2.y,y3.x,y3.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y4.x,y4.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x3.x,x3.y,y5.x,y5.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y6.x,y6.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x4.x,x4.y,y7.x,y7.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y8.x,y8.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x1.x,x1.y,y1.x,y1.y,radius);
        
    }
    
    
    CGPathCloseSubpath(pathRef);
    
    return pathRef;
}

#pragma mark - Utility

- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);  
    return [UIImage imageWithCGImage:masked];  
    
}

-(UIImage *)BXMaskImageInCircle:(UIImage *)image
{
    return [self BXMaskImageInCircle:image withStrokeColor:nil LineWidth:0];
}

-(UIImage *)BXMaskImageInCircle:(UIImage *)image withStrokeColor:(UIColor *)color LineWidth:(float)lineWidth
{
    float radius;
    if (image.size.width > image.size.height) {
        radius=image.size.height;
    }else
    {
        radius=image.size.width;
    }
    UIGraphicsBeginImageContext(CGSizeMake(radius + lineWidth, radius + lineWidth));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //CGContextSetLineWidth(context, 1);
    //CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGRect rect = lineWidth>0 ? CGRectMake(0, 0, radius + lineWidth, radius + lineWidth) : CGRectMake(0, 0, radius, radius) ;
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    if (image.size.width > image.size.height) {
        lineWidth>0 ? [image drawAtPoint:CGPointMake(-(image.size.width - image.size.height)/2 + lineWidth/2, 0 + lineWidth/2)] :[image drawAtPoint:CGPointMake(-(image.size.width - image.size.height)/2, 0)];
    }else
    {
        lineWidth>0 ? [image drawAtPoint:CGPointMake(0 + lineWidth/2 , -(image.size.height- image.size.width)/2 + lineWidth/2)] : [image drawAtPoint:CGPointMake(0, -(image.size.height- image.size.width)/2)];
    }
    
    //[image drawInRect:rect];
    if (lineWidth>0) {
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextSetLineWidth(context, lineWidth);
        CGContextAddEllipseInRect(context, CGRectMake(lineWidth/2, lineWidth/2, radius, radius));
        CGContextStrokePath(context);
    }
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

@end
