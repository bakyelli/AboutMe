//
//  ViewController.h
//  AboutMe2
//
//  Created by Jay Abdallah on 9/30/13.
//  Copyright (c) 2013 Jay Abdallah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>



@interface ViewController : UIViewController <ABNewPersonViewControllerDelegate>
{

}
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet UISegmentedControl *nameSelector;

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) NSString* pictureFile;
@property (weak, nonatomic) UIImage *imageForPicture;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) NSString* emailAddressStr;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) NSString* phoneNumberStr;
@property (weak, nonatomic) IBOutlet UITextView *aboutMe;
@property (weak, nonatomic) NSString* aboutMeStr;
@property (weak, nonatomic) NSString* twitterStr;
- (IBAction)twitterLink:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *twitterLinkOutlet;
//@property (weak, nonatomic) id<ABNewPersonViewControllerDelegate> newPersonViewDelegate;


@property (weak, nonatomic) IBOutlet UIButton *addToContactsButton;

- (IBAction)addToContacts:(id)sender;
- (void)addNewContact;

@end
