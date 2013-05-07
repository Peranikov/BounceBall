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
        
        [self scheduleUpdate];
    }
    
    return self;
}

- (void) update:(ccTime)delta
{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CGPoint position = self.block.position;
    
    if (position.x >= winSize.width || position.x <= 0)
    {
        [self.block reverseMoveX];
    }
    
    if (position.y >= winSize.height || position.y <= 0)
    {
        [self.block reverseMoveY];
    }
    
    [self.block move];
}

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
    
    self.block.moveX = 3;
    self.block.moveY = 3;
    
    [self addChild:self.block];
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
