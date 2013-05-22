//
//  LCPlotProvider.m
//  Achilles
//
//  Created by weiyanen on 13-5-18.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCPlotProvider.h"
#import "CPDConstants.h"
#import "CPDStockPriceStore.h"

@interface LCPlotProvider()

@end

@implementation LCPlotProvider

/*data提供数据量*/
- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
	if ([plot.identifier isEqual:CPDTickerSymbolSpeed]) {
		return [[[CPDStockPriceStore sharedInstance] datesInWeek] count];//5
	}
	else if ([plot.identifier isEqual:CPDTickerSymbolOil]) {
		return [[[CPDStockPriceStore sharedInstance] datesInMonth] count];//20
	}
	else if ([plot.identifier isEqual:CPDTickerSymbolTime]) {
		return [[[CPDStockPriceStore sharedInstance] tickerSymbols] count];
	}
	else {
		return 0;
	}
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx {
	/*For Pie*/
	if ([plot isKindOfClass:[CPTPieChart class]]) {
		//slice width
		switch (fieldEnum) {
			case CPTPieChartFieldSliceWidth:
				if ([plot.identifier isEqual:CPDTickerSymbolTime]) {
					return [[[CPDStockPriceStore sharedInstance] dailyPortfolioPrices] objectAtIndex:idx];

				}
				break;
			default:
				break;
		}
	}
	/*For Bar*/
	else if ([plot isKindOfClass:[CPTBarPlot class]]) {
		switch (fieldEnum) {
			//tip
			case CPTBarPlotFieldBarTip:
				if ([plot.identifier isEqual:CPDTickerSymbolSpeed] && idx < [[[CPDStockPriceStore sharedInstance] datesInWeek] count]) {
					//speed
					return [[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolSpeed] objectAtIndex:idx];
				}
				break;
			//location
			case CPTBarPlotFieldBarLocation:
				return [NSDecimalNumber numberWithUnsignedInteger:idx];
				break;
		}
	}
	/*For Scatter*/
	else if ([plot isKindOfClass:[CPTScatterPlot class]]) {
		//x轴
		switch (fieldEnum) {
			case CPTScatterPlotFieldX:
				if ([plot.identifier isEqual:CPDTickerSymbolOil] && idx < [[[CPDStockPriceStore sharedInstance] datesInMonth] count]) {
					return [NSNumber numberWithUnsignedInteger:idx];
				}
				break;
			//y轴
			case CPTScatterPlotFieldY:
				if ([plot.identifier isEqual:CPDTickerSymbolOil]) {
					return [[[CPDStockPriceStore sharedInstance] monthlyPrices:CPDTickerSymbolOil] objectAtIndex:idx];
				}
				break;
		}
	}
	/*任何情况下保证有返回*/
	return [NSDecimalNumber zero];
}


@end
