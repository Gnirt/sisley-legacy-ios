//
//  BumpViewController.m
//  Sisley
//
//  Created by ZIIW on 06/01/2016.
//  Copyright © 2016 Ziiw. All rights reserved.
//

#import "BumpViewController.h"
#import "AppDelegate.h"

@interface BumpViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSMutableArray *arrConnectedDevices;
@property (weak, nonatomic) IBOutlet UIButton *levreBtn;
@property (weak, nonatomic) IBOutlet UIButton *yeuxBtn;
@property (weak, nonatomic) IBOutlet UIView *switchProductView;
@property (weak, nonatomic) IBOutlet UIButton *ralBtn;
@property (weak, nonatomic) IBOutlet UIButton *eyeLinerBtn;

-(void)peerDidChangeStateWithNotification:(NSNotification *)notification;

@property (nonatomic) BOOL isLevre;


@end

@implementation BumpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isLevre = YES;
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[_appDelegate mcManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    [[_appDelegate mcManager] advertiseSelf:YES];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(peerDidChangeStateWithNotification:)
                                                 name:@"MCDidChangeStateNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveDataWithNotification:)
                                                 name:@"MCDidReceiveDataNotification"
                                               object:nil];
    
    _arrConnectedDevices = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)lipAction:(id)sender {
    self.msg = @"RAL";
    
    [UIView animateWithDuration:0.5f delay:0.15 options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.ralBtn setFrame:CGRectMake(-100, self.ralBtn.frame.origin.y, self.ralBtn.frame.size.width, self.ralBtn.frame.size.height)];
                     }
                     completion:nil];
    
    [self sendMyMessage];
}


- (IBAction)eyeAction:(id)sender {
    self.msg = @"EYE";
    
    [UIView animateWithDuration:0.5f delay:0.15 options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.eyeLinerBtn setFrame:CGRectMake(-100, self.eyeLinerBtn.frame.origin.y, self.eyeLinerBtn.frame.size.width, self.eyeLinerBtn.frame.size.height)];
                     }
                     completion:nil];
    [self sendMyMessage];
}

#pragma mark Switch products

- (IBAction)levreBtn:(id)sender {
    if(!self.isLevre){
        
        [UIView animateWithDuration:0.25f delay:0.0 options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.switchProductView.center = CGPointMake(self.switchProductView.center.x + 65, self.switchProductView.center.y);
                             self.levreBtn.alpha = 1.0f;
                             self.yeuxBtn.alpha = 0.3f;
                             self.ralBtn.alpha = 1.0f;
                             self.eyeLinerBtn.alpha = 0.0f;
                            
                             [self.ralBtn setEnabled:YES];
                             [self.eyeLinerBtn setEnabled:NO];
                         }
                         completion:nil];
        self.isLevre = YES;
    }
}

- (IBAction)yeuxBtn:(id)sender {
    if(self.isLevre){
        [UIView animateWithDuration:0.25f delay:0.0 options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.switchProductView.center = CGPointMake(self.switchProductView.center.x - 65, self.switchProductView.center.y);
                             self.levreBtn.alpha = 0.3f;
                             self.yeuxBtn.alpha = 1.0f;
                             self.ralBtn.alpha = 0.0f;
                             self.eyeLinerBtn.alpha = 1.0f;
                             
                             [self.ralBtn setEnabled:NO];
                             [self.eyeLinerBtn setEnabled:YES];
                         }
                         completion:nil];
        self.isLevre = NO;
    }
}


#pragma mark - Public method implementation

- (IBAction)browseForDevices:(id)sender {
    [[_appDelegate mcManager] setupMCBrowser];
    [[[_appDelegate mcManager] browser] setDelegate:self];
    [self presentViewController:[[_appDelegate mcManager] browser] animated:YES completion:nil];
}



#pragma mark - MCBrowserViewControllerDelegate method implementation

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
    
    self.msg = @"DONE";
    
    [self sendMyMessage];
    
    [UIView animateWithDuration:0.5f delay:0.0 options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.overlay.alpha = 0.0f;
                     }
                     completion:nil];
    NSLog(@"back from bluetooth");
}

#pragma mark - Private method implementation

-(void)sendMyMessage{
    NSData *dataToSend = [self.msg dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *allPeers = _appDelegate.mcManager.session.connectedPeers;
    NSError *error;
    
    [_appDelegate.mcManager.session sendData:dataToSend
                                     toPeers:allPeers
                                    withMode:MCSessionSendDataReliable
                                       error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
}


-(void)didReceiveDataWithNotification:(NSNotification *)notification{
    MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    NSString *peerDisplayName = peerID.displayName;
    
    NSData *receivedData = [[notification userInfo] objectForKey:@"data"];
    NSString *receivedText = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", receivedText);
}


-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
    [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Private method implementation

-(void)peerDidChangeStateWithNotification:(NSNotification *)notification{
    MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    NSString *peerDisplayName = peerID.displayName;
    MCSessionState state = [[[notification userInfo] objectForKey:@"state"] intValue];
    
    if (state != MCSessionStateConnecting) {
        if (state == MCSessionStateConnected) {
            [_arrConnectedDevices addObject:peerDisplayName];
        }
        else if (state == MCSessionStateNotConnected){
            if ([_arrConnectedDevices count] > 0) {
                int indexOfPeer = [_arrConnectedDevices indexOfObject:peerDisplayName];
                [_arrConnectedDevices removeObjectAtIndex:indexOfPeer];
            }
        }
//        [_tblConnectedDevices reloadData];
    }
}




@end
