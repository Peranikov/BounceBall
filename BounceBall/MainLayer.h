//
//  MainLayer.h
//  BounceBall
//
//  Created by Yuto Matsukubo on 2013/05/07.
//  Copyright 2013年 Yuto Matsukubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Block.h"

@interface MainLayer : CCLayerColor {
    
}

@property (nonatomic, retain) Block *block;

+(CCScene *) scene;

@end
