//
//  LTDataPiece.h
//  Peleus
//
//  Created by ChrisLiu  on 5/2/13.
//  Copyright (c) 2013 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTDataService.h"

@interface LTDataPiece : NSObject
{
    Span span;
    int zeroTime;
    int lowTime;
    int midTime;
    int highTime;
    int overTime;
    int dist;
    int brake;
    int acc;
    double oilCost;
    double wTemp;
    int beginTime;
    int endTime;
}



@end