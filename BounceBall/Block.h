//
//  Block.h
//  BounceBall
//
//  Created by Yuto Matsukubo on 2013/05/07.
//  Copyright 2013年 Yuto Matsukubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Block : CCLayerColor {
    
}

@property (nonatomic) CGFloat moveX;
@property (nonatomic) CGFloat moveY;
@property (nonatomic, retain) CCPointArray *touchLocus;

- (void)reverseMoveX;
- (void)reverseMoveY;
- (void)move;

@end
