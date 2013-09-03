//
//  AttributedStringViewController.m
//  AttributedString
//
//  Created by Richard Ting on 9/3/13.
//  Copyright (c) 2013 Richard Ting. All rights reserved.
//

#import "AttributedStringViewController.h"

@interface AttributedStringViewController ()
@property (weak, nonatomic) IBOutlet UILabel *upLabel;
@property (weak, nonatomic) IBOutlet UILabel *downLabel;
@end

#define TITLE_STRING @"APPLE"
#define SUBTITLE_STRING @"iPod / iPhone / iPad"

@implementation AttributedStringViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self setFontSizeForAttributedString];
    [self setTextColorForAttributedString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFontSizeForAttributedString
{
    self.upLabel.numberOfLines = 0; // set unlimited lines
    self.upLabel.text = [NSString stringWithFormat:@"%@\n%@", TITLE_STRING, SUBTITLE_STRING];
    NSRange range;

    range = [[self.upLabel.attributedText string] rangeOfString:TITLE_STRING];
    [self addLabelAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:40]} range:range label:self.upLabel];

    range = [[self.upLabel.attributedText string] rangeOfString:SUBTITLE_STRING];
    [self addLabelAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:15]} range:range label:self.upLabel];
}

- (void)setTextColorForAttributedString
{
    self.downLabel.numberOfLines = 0; // set unlimited lines
    self.downLabel.text = [NSString stringWithFormat:@"%@\n%@", TITLE_STRING, SUBTITLE_STRING];
    NSRange range;

    range = [[self.downLabel.attributedText string] rangeOfString:TITLE_STRING];
    [self addLabelAttributes:@{ NSForegroundColorAttributeName : [UIColor redColor]} range:range label:self.downLabel];

    range = [[self.downLabel.attributedText string] rangeOfString:SUBTITLE_STRING];
    [self addLabelAttributes:@{ NSForegroundColorAttributeName : [UIColor greenColor]} range:range label:self.downLabel];
}

// add attributes to the given range in label
- (void)addLabelAttributes:(NSDictionary *)attributes range:(NSRange)range label:(UILabel *)label
{
    if (range.location != NSNotFound) {
        NSMutableAttributedString *mat = [label.attributedText mutableCopy];
        [mat addAttributes:attributes
                     range:range];
        label.attributedText = mat;
    }
}

@end
