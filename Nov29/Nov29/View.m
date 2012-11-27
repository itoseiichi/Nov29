//
//  View.m
//  Nov29
//
//  Created by Hachi on 11/25/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		
		//Center the button in the view.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(100, 30);	//size of button
		
		button.frame = CGRectMake(
								  b.origin.x + (b.size.width - s.width) / 2,
								  b.origin.y + (b.size.height - s.height) / 2 - 100,
								  s.width,
								  s.height
								  );
		
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: @"Elect!!" forState: UIControlStateNormal];
		
		[button addTarget: [UIApplication sharedApplication].delegate
				   action: @selector(touchUpInside:)
		 forControlEvents: UIControlEventTouchUpInside
		 ];
		
		[self addSubview: button];
	}
	return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code

	
	
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//seven red stripes
	CGContextBeginPath(c);
		for (int i = 0; i <= 12; i = i + 2){
		CGContextAddRect(c, CGRectMake(i * w /13, 0, w / 13, h));
	}
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
	
	//blue union jack
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake(w * 6 / 13, 0, w * 7 / 13, h * 2 / 5));
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);
	
	//White star has 5 vertices (points).
	CGPoint center = CGPointMake((6 + 3.5) * w / 13, h / 5); //of union jack
	CGFloat radius = h / 10;	//of circle that the 5 vertices touch
	CGContextBeginPath(c);
	
	CGFloat theta = 0;		//Start with vertex pointing to right.
	CGContextMoveToPoint(c,
						 center.x + radius * cosf(theta),
						 center.y - radius * sinf(theta)
						 );
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
	CGContextAddLineToPoint(c,
							center.x + radius * cosf(theta),
							center.y - radius * sinf(theta)
							);
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower right
	CGContextAddLineToPoint(c,
							center.x + radius * cosf(theta),
							center.y - radius * sinf(theta)
							);
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper right
	CGContextAddLineToPoint(c,
							center.x + radius * cosf(theta),
							center.y - radius * sinf(theta)
							);
	
	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower left
	CGContextAddLineToPoint(c,
							center.x + radius * cosf(theta),
							center.y - radius * sinf(theta)
							);
	
	//Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
	CGContextFillPath(c);
	
	
	//Write Question
	UIFont *font00 = [UIFont boldSystemFontOfSize: 20.0];
    NSString *string00 = @"Which is the next President?";
	CGSize size00 = [string00 sizeWithFont: font00];
	CGPoint point00 = CGPointMake((w - size00.width) / 2 , size00.height + 20);
	CGContextRef c_string00 = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c_string00, 0, 0, 0, 1);
	[string00 drawAtPoint: point00 withFont: font00];
	
    //Photo&String
	UIImage *image1 = [UIImage imageNamed: @"barack_obama.jpg"];
	UIImage *image2 = [UIImage imageNamed: @"mitt_romney.jpg"];
	//NSString *string0 = @"Elect! (Double Click!!)";
	NSString *string1 = @"Democratic";
	NSString *string2 = @"Republican";
		
	//upper left corner of image1
	CGPoint point1 = CGPointMake(
								 (w - image1.size.width) / 2,
								 h - image1.size.height - image2.size.height - 40);
	
	//upper left corner of image2
	CGPoint point2 = CGPointMake(
								 (w - image2.size.width) / 2,
								 h - image2.size.height - 20);
	
	//set string
	//UIFont *font0 = [UIFont boldSystemFontOfSize: 20.0];
	UIFont *font1 = [UIFont boldSystemFontOfSize: 18.0];
	UIFont *font2 = [UIFont boldSystemFontOfSize: 18.0];
	//CGSize size0 = [string0 sizeWithFont: font0];
	//CGPoint point0 = CGPointMake((w - size0.width) / 2 , size0.height  + 40);
	CGContextRef c_string0 = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c_string0, 0, 1, 0, 1);
	
		[image1 drawAtPoint: point1];
		[image2 drawAtPoint: point2];
		//[string0 drawAtPoint: point0 withFont: font0];
		[string1 drawAtPoint: point1 withFont: font1];
		[string2 drawAtPoint: point2 withFont: font2];
		
}

@end