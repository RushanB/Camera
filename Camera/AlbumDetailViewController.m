//
//  AlbumDetailViewController.m
//  Camera
//
//  Created by Rushan on 2017-05-28.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "AlbumDetailViewController.h"

@interface AlbumDetailViewController ()

@end

@implementation AlbumDetailViewController

@synthesize slideImage;

- (IBAction)openCameraView:(id)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){  //gets camera
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.delegate = self;
        [pickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        
        pickerController.allowsEditing = YES;
        [self presentViewController:pickerController animated:YES completion:nil];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"OOPS!" message:@"Your device does not have a camera." preferredStyle:UIAlertControllerStyleAlert]; //no camera
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil]; //dissmiss after cancel
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerEditedImage];
    self.slideImage.image = image; //show image

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = UIImageJPEGRepresentation(slideImage.image, 1.0);
    [defaults setObject:data forKey:@"myImage"];
    [defaults synchronize];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"myImage"]){
        NSData *loadData = [defaults objectForKey:@"myImage"];
        slideImage.image = [UIImage imageWithData:loadData]; //loads my image to view
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
