//
//  Block.m
//  BounceBall
//
//  Created by Yuto Matsukubo on 2013/05/07.
//  Copyright 2013年 Yuto Matsukubo. All rights reserved.
//

#import "Block.h"


@implementation Block

- (void)reverseMoveX
{
    self.moveX *= -1;
}

- (void)reverseMoveY
{
    self.moveY *= -1;
}

- (void)move
{
//    self.position = CGPointMake(self.position.x + self.moveX, self.position.y + self.moveY);
    [self runAction:[CCCatmullRomTo actionWithDuration:0.5 points:self.touchLocus]];
}

@end
