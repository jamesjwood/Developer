//
//  ClaculatorBrain.h
//  Calculator
//
//  Created by James Wood on 12/06/2014.
//
//

#import <Foundation/Foundation.h>

@interface ClaculatorBrain : NSObject
-(void)pushOperand: (double)operand;
-(double)performOperation:(NSString *)operation;


@property (readonly) id program;

+(double)runProgram:(id)program;
+(NSString *)descriptionOfProgram:(id)program;

@end
