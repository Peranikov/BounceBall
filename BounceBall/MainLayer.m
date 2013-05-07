//
//  MainLayer.m
//  BounceBall
//
//  Created by Yuto Matsukubo on 2013/05/07.
//  Copyright 2013年 Yuto Matsukubo. All rights reserved.
//

#import "MainLayer.h"


@implementation MainLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MainLayer *layer = [MainLayer node];
	[scene addChild: layer];
	return scene;
}

- (id)init
{
	if((self = [super init]))
    {
        [self setBackground];
        
        [self setBlock];
        
//        [self scheduleUpdate];
        
        self.touchEnabled = YES;
    }
    
    return self;
}

//- (void) update:(ccTime)delta
//{
//    CGSize winSize = [[CCDirector sharedDirector] winSize];
//    CGPoint position = self.block.position;
//    
//    if (position.x >= winSize.width || position.x <= 0)
//    {
//        [self.block reverseMoveX];
//    }
//    
//    if (position.y >= winSize.height || position.y <= 0)
//    {
//        [self.block reverseMoveY];
//    }
//    
//    [self.block move];
//}

// ブロックを設置します
- (void)setBlock
{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    self.block = [Block layerWithColor:ccc4(0, 192, 226, 255)];
    self.block.contentSize = CGSizeMake(20, 20);
    self.block.position = ccp(winSize.width / 2, winSize.height / 4);
	self.block.anchorPoint = ccp(0.5,0.5);
    self.block.ignoreAnchorPointForPosition = NO;
    
    [self.block runAction:[CCRepeatForever actionWithAction:[CCRotateBy actionWithDuration:4.f angle:360]]];
    
    [self addChild:self.block];
}

// タッチが開始したとき
-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
    
    
    CGRect blockRect = CGRectMake(self.block.position.x - self.block.contentSize.width / 2,
                                  self.block.position.y - self.block.contentSize.height / 2,
                                  self.block.contentSize.width,
                                  self.block.contentSize.height);
    
    if (point.x >= blockRect.origin.x &&
        point.x <= blockRect.origin.x + blockRect.size.width &&
        point.y >= blockRect.origin.y &&
        point.y <= blockRect.origin.y + blockRect.size.width)
    {
        self.block.color = ccc3(249, 79, 218);
        self.block.touchLocus = [CCPointArray arrayWithCapacity:50];
        [self.block.touchLocus addControlPoint:ccp(0,0)];
    }
}

// タッチが移動してるときの処理です
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
    [self.block.touchLocus addControlPoint:point];
}

// タッチが終了した時の処理です
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.block move];
}

// 背景を設定します
- (void)setBackground
{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    CCLayerColor *background = [CCLayerColor layerWithColor:ccc4(255, 255, 255, 255)];
    background.contentSize = CGSizeMake(winSize.width, winSize.height);
    background.position = ccp(winSize.width / 2, winSize.height / 2);
	background.anchorPoint = ccp(0.5,0.5);
    background.ignoreAnchorPointForPosition = NO;

    [self addChild:background];
}

// 四角形のイメージを返します
+ (UIImage *)createSquareWithColor:(UIColor *)color size:(CGSize)size
{
    UIImage *image = [[[UIImage alloc] init] autorelease];
    
    UIGraphicsBeginImageContext(size);
    [image drawAtPoint:CGPointZero];
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
