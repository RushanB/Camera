//
//  AlbumDetailViewController.h
//  Camera
//
//  Created by Rushan on 2017-05-28.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumDetailViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *slideImage;

@end
