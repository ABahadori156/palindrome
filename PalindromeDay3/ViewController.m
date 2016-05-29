//
//  ViewController.m
//  PalindromeDay3
//
//  Created by Pasha Bahadori on 5/25/16.
//  Copyright © 2016 Pelican Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *yesNoLabel;

@end

@implementation ViewController

// JanL likes ginger ale & milk 



- (IBAction)onCheck:(UIButton *)sender {
    NSString *palindrome = self.textField.text;
    NSUInteger lengthOfPalindrome = palindrome.length;
    NSLog(@"Length of Palindrome = %lu", lengthOfPalindrome);
    
    // for the first loop, we print out the first character index and first character letter of our palindrome from the text field
    // ie: racecar's first character index = 0 and first character letter = r
    // ie: racecar's second character index = 1 and second character letter = a
    
    for (int i = 0; i < lengthOfPalindrome / 2; i++) {
        NSLog(@"[palindrome characterAtIndex: %i] = %c", i, [palindrome characterAtIndex:i]);
        if ([palindrome characterAtIndex:i] != [palindrome characterAtIndex:lengthOfPalindrome - 1 - i]) {
            self.yesNoLabel.text = @"Not a Palindrome..";
            return;
        }
        // NSLog(@"[palindrome characterAtIndex: %i] = %c", i, [palindrome characterAtIndex:i]);
    }
    self.yesNoLabel.text = @"It's a Palindrome!";
}


// IMPORTANT: Algorithm for taking a string and adding it's reversed version string to the original
- (IBAction)onMakePalindrome:(id)sender {
    
    NSString *palindrome = self.textField.text;
    // the second part is the reverse of the first part
    // how to reverse a string  hint: (for loop)
    // repeatedly adding to the 2nd part
    NSString *firstPart = self.textField.text;
    NSMutableString *secondPart = [[NSMutableString alloc] init];
    NSInteger charIndex = [firstPart length];
    
    while (firstPart && charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [secondPart appendString:[firstPart substringWithRange:subStrRange]];
    }
    
    
    self.yesNoLabel.text = [NSString stringWithFormat:@"%@%@", firstPart, secondPart];
    
    
    /* first retrieve the text of textField1
     
     NSString *myString = textField1.text;
     NSMutableString *reversedString = [NSMutableString string];
     NSInteger charIndex = [myString length];
     while (myString && charIndex > 0) {
     charIndex--;
     NSRange subStrRange = NSMakeRange(charIndex, 1);
     [reversedString appendString:[myString substringWithRange:subStrRange]];
     }
     // reversedString is reversed, or empty if myString was nil
     textField2.text = reversedString;
     */
    
    
    /*
     NSString *string1 = @"Sam";
     NSMutableString *string2 = [[NSMutableString alloc] initWithString:@"Smash"];
     NSString *string3 = [string1 stringByAppendingString:string2];
     NSLog(@"%@", string3);
     */
    // string 1 is a NSString and string2 is NSMutableString
    // NSString *string3 = [string1 stringByAppendingFormat: @" %@ %@", string2, @"A third string"];
    
    
    // Student Challenge: setup so the firstPart and secondPart make a palindrome
}



@end
