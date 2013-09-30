//
//  ViewController.m
//  AboutMe2
//
//  Created by Jay Abdallah on 9/30/13.
//  Copyright (c) 2013 Jay Abdallah. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@end

@implementation ViewController
@synthesize lblName, name, nameSelector, emailAddress,emailAddressStr;
@synthesize picture;
@synthesize pictureFile, imageForPicture, phoneNumber, phoneNumberStr, aboutMe, aboutMeStr, twitterStr, twitterLinkOutlet, addToContactsButton;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [nameSelector sendActionsForControlEvents:UIControlEventValueChanged];
    
}

-(void) newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person
{
    NSLog(@"I entered the delegate");
    if(person == nil)
        [newPersonView dismissViewControllerAnimated:TRUE completion:nil];
    else{
        // [addToContactsButton setEnabled:FALSE];
        [newPersonView dismissViewControllerAnimated:TRUE completion:nil];

    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentedControl:(id)sender {
    UISegmentedControl* segmentedControl = (UISegmentedControl*) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        NSLog(@"Jay pressed the button");
        name = @"Jay";
        pictureFile = @"Jay.JPG";
        emailAddressStr = @"jay.h.abdallah@gmail.com";
        phoneNumberStr = @"917 693 5974";
        aboutMeStr = @"I worked at a dining start-up in New York and attended an iOS program in Chicago";
        twitterStr = @"http://www.twitter.com/tinycomputers";
        
    } else if (selectedSegment == 1) {

        NSLog(@"Basar pressed the button");
        name = @"Basar";
        pictureFile = @"Basar.png";
        emailAddressStr = @"bakyelli@gmail.com";
        phoneNumberStr = @"646 944 3263";
        aboutMeStr = @"I worked for Deloitte as a Computer Forensics Consultant.";
        twitterStr = @"http://www.twitter.com/bakyelli";
    }
    [lblName setText:name];
    imageForPicture = [UIImage imageNamed:pictureFile];
    [picture setImage:imageForPicture];
    [emailAddress setText:emailAddressStr];
    [phoneNumber setText:phoneNumberStr];
    [aboutMe setText:aboutMeStr];
    [twitterLinkOutlet setTitle:@"Twitter" forState:UIControlStateNormal];
    
}


- (IBAction)twitterLink:(id)sender {
    NSLog(@"Twitter link clicked!");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:twitterStr]];
}



- (IBAction)addToContacts:(id)sender {
    [self addNewContact];
    NSLog(@"Contact added");


    
}


-(void)addNewContact{
   
    ABNewPersonViewController *newPersonView = [[ABNewPersonViewController alloc]init];
    
    ABRecordRef person = ABPersonCreate();
    

    
    ABMutableMultiValueRef phoneNumberMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(phoneNumberMultiValue, (__bridge CFTypeRef)(phoneNumberStr), kABPersonPhoneMobileLabel, NULL);
    
    ABRecordSetValue(person, kABPersonFirstNameProperty, (__bridge CFTypeRef)(name), nil);
    ABRecordSetValue(person, kABPersonPhoneProperty, phoneNumberMultiValue,nil);
    

    [newPersonView setDisplayedPerson:person];
    newPersonView.newPersonViewDelegate = self;
    
    UINavigationController *newNavigationController = [[UINavigationController alloc] initWithRootViewController:newPersonView];

    
    
    
    
    [self presentViewController:newNavigationController animated:TRUE completion:^{
        //
    }];
    CFRelease(person);
    
    
    
}


@end
