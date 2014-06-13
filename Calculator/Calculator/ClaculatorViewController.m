//
//  ClaculatorViewController.m
//  Calculator
//
//  Created by James Wood on 12/06/2014.
//
//

#import "ClaculatorViewController.h"
#import "ClaculatorBrain.h"

@interface ClaculatorViewController()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;

@property (nonatomic, strong) ClaculatorBrain *brain;
@end

@implementation ClaculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

-(ClaculatorBrain *)brain
{
    if(!_brain) _brain = [[ClaculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *didget = sender.currentTitle;
    NSLog(@"didget pressed = %@", didget);
    NSString *currentText = self.display.text;
    
    if(self.userIsInTheMiddleOfEnteringANumber){
        self.display.text = [currentText stringByAppendingString:didget];
    }
    else{
        self.display.text = didget;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)pressed:(UIButton *)sender {
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString  = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}
- (IBAction)enterPressed:(UIButton *)sender {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

@end
