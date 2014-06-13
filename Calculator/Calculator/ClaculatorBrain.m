//
//  ClaculatorBrain.m
//  Calculator
//
//  Created by James Wood on 12/06/2014.
//
//

#import "ClaculatorBrain.h"

@interface ClaculatorBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation ClaculatorBrain
@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack
{
    if(_operandStack==nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(void)pushOperand: (double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject)[self.operandStack removeLastObject];
    return [operandObject doubleValue];
}
-(double)performOperation:(NSString *)operation
{
    double result = 0;
    if([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }else if([operation isEqualToString:@"-"]){
        result =  0 - [self popOperand] +[self popOperand];
    }else if([operation isEqualToString:@"*"]){
        result =  [self popOperand] *[self popOperand];
    }else if([operation isEqualToString:@"/"]){
        result =  (1/[self popOperand]) *[self popOperand];
    }
    [self pushOperand: result];
    return result;
}

@end
