//
//  ClaculatorBrain.m
//  Calculator
//
//  Created by James Wood on 12/06/2014.
//
//

#import "ClaculatorBrain.h"

@interface ClaculatorBrain()

@property (nonatomic, strong) NSMutableArray *programStack;
@end

@implementation ClaculatorBrain
@synthesize programStack = _programStack;

-(NSMutableArray *)programStack
{
    if(_programStack==nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

-(void)pushOperand: (double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}

-(id)program{
    return [self.programStack copy];
}

+(NSString *)descriptionOfProgram:(id)program
{
    NSString *description;
    
    for (NSString *operand in program) {
        description = [description stringByAppendingString:operand];
    }
    return description;
}

+(double)runProgram:(id)program{
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]])
    {
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}

+(double)popOperandOffStack:(NSMutableArray *)stack{
    double result = 0;
    id topOfStack = [stack lastObject];
    if(topOfStack)[stack removeLastObject];
    
    if ([topOfStack isKindOfClass:([NSNumber class])])
    {
        return [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]])
    {
        NSString  *operation = topOfStack;
        if([operation isEqualToString:@"+"]){
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        }else if([operation isEqualToString:@"-"]){
            result =  0 - [self popOperandOffStack:stack] +[self popOperandOffStack:stack];
        }else if([operation isEqualToString:@"*"]){
            result =  [self popOperandOffStack:stack] *[self popOperandOffStack:stack];
        }else if([operation isEqualToString:@"/"]){
            result =  (1/[self popOperandOffStack:stack]) *[self popOperandOffStack:stack];
        }
    }
    return result;
}

-(double)performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    return [ClaculatorBrain runProgram:self.program];
}

@end
