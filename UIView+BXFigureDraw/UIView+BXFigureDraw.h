//
//  BRUXUIView+FigureDraw.h
//  FigureDraw
//
//  Created by BRUX on 14-2-21.
//  Copyright (c) 2014年 BRUX All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (FigureDraw)




/**
 *  在当前的Graphics context中绘制圆角矩形
 *
 *  @param rect        需要绘制的圆角矩形的框架
 *  @param radius      圆角矩形的半径
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 */
-(void)BXDrawRoundedRectangle:(CGRect)rect
                       radius:(float)radius
                  drawingMode:(CGPathDrawingMode)drawingMode;

/**
 *  获取一张圆角矩形的UIIamge
 *
 *  @param size        圆角矩形的大小
 *  @param radius      圆角矩形的半径
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 *  @param color       圆角矩形的颜色
 *
 *  @return 圆角矩形的UIIamge
 */
-(UIImage *)BXRoundedRectangleImage:(CGSize)size
                             radius:(float)radius
                        drawingMode:(CGPathDrawingMode)drawingMode
                              color:(UIColor *)color;

/**
 *  在当前的Graphics context中绘制矩形
 *
 *  @param rect        需要绘制的矩形的框架
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 */
-(void)BXDrawRectangle:(CGRect)rect
           drawingMode:(CGPathDrawingMode)drawingMode;

/**
 *  获取一张矩形的UIIamge
 *
 *  @param size        矩形的大小
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 *  @param color       矩形的颜色
 *
 *  @return 矩形的UIIamge
 */
-(UIImage *)BXRectangleImage:(CGSize)size
                 drawingMode:(CGPathDrawingMode)drawingMode
                       color:(UIColor *)color;

/**
 *  在当前的Graphics context中绘制多边形
 *
 *  @param pointValues 一个包含所有路径点NSArray,要求其中所有的元素都是NSValue封装的CGPoint,并且元素数量必须大于等于3，否则将不会绘制
 *  @param drawingMode 制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 */
-(void)BXDrawPolygon:(NSArray *)pointValues
         drawingMode:(CGPathDrawingMode)drawingMode;

/**
 *  获取一张多边形的UIIamge
 *
 *  @param pointValues 一个包含所有路径点NSArray,要求其中所有的元素都是NSValue封装的CGPoint,并且元素数量必须大于等于3，否则将绘制失败，返回空的图像
 *  @param size        图像的大小
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 *  @param color       多边形的颜色
 *
 *  @return 多边形的UIIamge
 */
-(UIImage *)BXPolygonImage:(NSArray *)pointValues
                      size:(CGSize)size
               drawingMode:(CGPathDrawingMode)drawingMode
                     color:(UIColor *)color;

/**
 *  在当前的Graphics context中绘制圆形
 *
 *  @param center      圆心
 *  @param radius      半径
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 */
-(void)BXDrawCircleWithCenter:(CGPoint)center
                       radius:(float)radius
                  drawingMode:(CGPathDrawingMode)drawingMode;

/**
 *  获取一张圆形的UIIamge
 *
 *  @param center      圆心
 *  @param radius      半径
 *  @param size        图像的大小
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 *  @param color       圆形的颜色
 *
 *  @return 圆形的UIImage
 */
-(UIImage *)BXCircleImageWithCenter:(CGPoint)center
                             radius:(float)radius
                               size:(CGSize)size
                        drawingMode:(CGPathDrawingMode)drawingMode
                              color:(UIColor *)color;

//扇形

/**
 *  在当前的Graphics context中绘制扇形
 *
 *  @param center      圆心
 *  @param radius      半径
 *  @param startAngle  起始角度的弧度值
 *  @param endAngle    终止角度的弧度值
 *  @param clockwise   是否顺时针绘制
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 */
-(void)BXDrawSectorFromCenter:(CGPoint)center
                       radius:(float)radius
                   startAngle:(float)startAngle
                     endAngle:(float)endAngle
                    clockwise:(BOOL)clockwise
                  drawingMode:(CGPathDrawingMode)drawingMode;

/**
 *  获取一张扇形的UIIamge
 *
 *  @param center      圆心
 *  @param radius      半径
 *  @param startAngle  起始角度的弧度值
 *  @param endAngle    终止角度的弧度值
 *  @param clockwise   是否顺时针绘制
 *  @param size        图像的大小
 *  @param drawingMode 绘制路径的方式,例如传入 kCGPathFillStroke 以实心模式绘制
 *  @param color       扇形的颜色
 *
 *  @return 扇形的UIIamge
 */
-(UIImage *)BXSectorImageFromCenter:(CGPoint)center
                             radius:(float)radius
                         startAngle:(float)startAngle
                           endAngle:(float)endAngle
                          clockwise:(BOOL)clockwise
                               size:(CGSize)size
                        drawingMode:(CGPathDrawingMode)drawingMode
                              color:(UIColor *)color;

/**
 *  在当前的Graphics context中绘制单一线段
 *
 *  @param startPoint 线段的起点
 *  @param endPoint   线段的终点
 */
-(void)BXDrawLineFrom:(CGPoint)startPoint
                   to:(CGPoint)endPoint;

/**
 *  获取一张单一线段的UIIamge
 *
 *  @param startPoint 线段的起点
 *  @param endPoint   线段的终点
 *  @param size       图像的大小
 *  @param color      线段的颜色
 *
 *  @return 单一线段的UIIamge
 */
-(UIImage *)BXLineImageFrom:(CGPoint)startPoint
                         to:(CGPoint)endPoint
                       size:(CGSize)size
                      color:(UIColor *)color;

/**
 *  在当前的Graphics context中绘制首尾相接的连续线段
 *
 *  @param pointValues 一个包含所有路径点NSArray,要求其中所有的元素都是NSValue封装的CGPoint,并且元素数量必须大于等于2，否则将不会绘制
 */
-(void)BXDrawLines:(NSArray *)pointValues;

/**
 *  获取一张首尾相接的连续线段的UIIamge
 *
 *  @param pointValues 一个包含所有路径点NSArray,要求其中所有的元素都是NSValue封装的CGPoint,并且元素数量必须大于等于2，否则将绘制失败，返回空的图像
 *  @param size        图像的大小
 *  @param color       线段的颜色
 *
 *  @return 首尾相接的连续线段的UIIamge
 */
-(UIImage *)BXLinesImage:(NSArray *)pointValues
                    size:(CGSize)size
                   color:(UIColor *)color;

/**
 *  在当前的Graphics context中绘制三次贝塞尔曲线
 *
 *  @param startPoint         曲线的起点
 *  @param endPoint           曲线的终点
 *  @param firstControlPoint  第一控制点
 *  @param secondControlPoint 第二控制点
 */
-(void)BXDrawCurveFrom:(CGPoint)startPoint
                    to:(CGPoint)endPoint
     firstControlPoint:(CGPoint)firstControlPoint
    secondControlPoint:(CGPoint)secondControlPoint;

/**
 *  获取一张三次贝塞尔曲线的UIIamge
 *
 *  @param startPoint         曲线的起点
 *  @param endPoint           曲线的终点
 *  @param firstControlPoint  第一控制点
 *  @param secondControlPoint 第二控制点
 *  @param size               图像的大小
 *  @param color              曲线的颜色
 *
 *  @return 三次贝塞尔曲线的UIIamge
 */
-(UIImage *)BXCurveImageFrom:(CGPoint)startPoint
                          to:(CGPoint)endPoint
           firstControlPoint:(CGPoint)firstControlPoint
          secondControlPoint:(CGPoint)secondControlPoint
                        size:(CGSize)size
                       color:(UIColor *)color;

/**
 *  在当前的Graphics context中绘制二次贝塞尔曲线
 *
 *  @param startPoint   曲线的起点
 *  @param endPoint     曲线的终点
 *  @param controlPoint 控制点
 */
-(void)BXDrawQuadCurveFrom:(CGPoint)startPoint
                    to:(CGPoint)endPoint
          ControlPoint:(CGPoint)controlPoint;

/**
 *  获取一张二次贝塞尔曲线的UIIamge
 *
 *  @param startPoint   曲线的起点
 *  @param endPoint     曲线的终点
 *  @param controlPoint 控制点
 *  @param size         图像的大小
 *  @param color        曲线的颜色
 *
 *  @return 二次贝塞尔曲线的UIIamge
 */
-(UIImage *)BXQuadCurveImageFrom:(CGPoint)startPoint
                          to:(CGPoint)endPoint
                ControlPoint:(CGPoint)controlPoint
                        size:(CGSize)size
                       color:(UIColor *)color;

/**
 *  在当前的Graphics context中绘制弧线
 *
 *  @param center     圆心
 *  @param radius     半径
 *  @param startAngle 起始角度的弧度值
 *  @param endAngle   终止角度的弧度值
 *  @param clockwise  是否顺时针绘制
 */
-(void)BXDrawArcFromCenter:(CGPoint)center
                    radius:(float)radius
                startAngle:(float)startAngle
                  endAngle:(float)endAngle
                 clockwise:(BOOL)clockwise;

/**
 *  获取一张弧线的UIIamge
 *
 *  @param center     圆心
 *  @param radius     半径
 *  @param startAngle 起始角度的弧度值
 *  @param endAngle   终止角度的弧度值
 *  @param clockwise  是否顺时针绘制
 *  @param size       图像的大小
 *  @param color      弧线的颜色
 *
 *  @return 弧线的UIIamge
 */
-(UIImage *)BXArcImageFromCenter:(CGPoint)center
                     radius:(float)radius
                 startAngle:(float)startAngle
                   endAngle:(float)endAngle
                  clockwise:(BOOL)clockwise
                       size:(CGSize)size
                      color:(UIColor *)color;

#pragma mark - Utility

/**
 *  获取UIView的截图
 *
 *  @return UIView截图
 */
-(UIImage *)BXSnap;

/**
 *  将图片居中剪裁成圆形，不改变原比例
 *
 *  @param image  源图片
 *
 *  @return 剪裁成圆形的图片
 */
-(UIImage *)BXMaskImageInCircle:(UIImage *)image;

/**
 *  将图片居中剪裁成圆形，不改变原比例，并描边
 *
 *  @param image     原图片
 *  @param color     描边的颜色
 *  @param lineWidth 描边的宽度
 *
 *  @return 剪裁成圆形的图片
 */
-(UIImage *)BXMaskImageInCircle:(UIImage *)image withStrokeColor:(UIColor *)color LineWidth:(float)lineWidth;

@end
