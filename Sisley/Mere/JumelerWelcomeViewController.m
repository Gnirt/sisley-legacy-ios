//
//  JumelerWelcomeViewController.m
//  Sisley
//
//  Created by Philippe Tring on 05/01/2016.
//  Copyright © 2016 Ziiw. All rights reserved.
//

#import "JumelerWelcomeViewController.h"
#import "AppDelegate.h"

@interface JumelerWelcomeViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSMutableArray *arrConnectedDevices;

-(void)peerDidChangeStateWithNotification:(NSNotification *)notification;

@end

@implementation JumelerWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MCBrowserViewControllerDelegate method implementation

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"back from bluetooth");
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
    
    //    [_tvChat setText:[_tvChat.text stringByAppendingString:[NSString stringWithFormat:@"I wrote:\n%@\n\n", _txtMessage.text]]];
    //    [_txtMessage setText:@""];
    //    [_txtMessage resignFirstResponder];
}


-(void)didReceiveDataWithNotification:(NSNotification *)notification{
    //MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    //NSString *peerDisplayName = peerID.displayName;
    
    NSData *receivedData = [[notification userInfo] objectForKey:@"data"];
    NSString *receivedText = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", receivedText);
    if([receivedText isEqualToString:@"DONE"]){
        [self performSelectorOnMainThread:@selector(fadeOverlay) withObject:nil waitUntilDone:NO];
    }else if([receivedText isEqualToString:@"RAL"] || [receivedText isEqualToString:@"EYE"]){
        [self performSelectorOnMainThread:@selector(addProduct:) withObject:receivedText waitUntilDone:NO];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)goToNextScreen:(id)sender {
// shared space between mom and daughter branch need merge
//    JumelerWelcomeViewController *JumelerWelcome = [[JumelerWelcomeViewController alloc] initWithNibName:nil bundle:nil];
//    [self presentViewController:JumelerWelcome animated:YES completion:nil];
}

- (void)fadeOverlay {
    [UIView animateWithDuration:0.5f delay:0.0f options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.overlay.alpha = 0.0f;
                     }
                     completion:nil];
}

- (void)addProduct:(NSString *)element {
    [UIView animateWithDuration:0.5f delay:0.5f options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         if ([element isEqualToString:@"RAL"]) {
                             [self.ralImage setFrame:CGRectMake(109, self.ralImage.frame.origin.y, self.ralImage.frame.size.width, self.ralImage.frame.size.height)];
                         } else if ([element isEqualToString:@"EYE"]) {
                             [self.ralImage setFrame:CGRectMake(50, self.ralImage.frame.origin.y, self.ralImage.frame.size.width, self.ralImage.frame.size.height)];
                             [self.eyeLinerImage setFrame:CGRectMake(170, self.eyeLinerImage.frame.origin.y, self.eyeLinerImage.frame.size.width, self.eyeLinerImage.frame.size.height)];
                         }
                     }
                     completion:nil];
}

@end
