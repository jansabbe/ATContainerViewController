#import "ATViewController.h"
#import "ATContainerViewController.h"
#import "ATThirdViewController.h"

@interface ATViewController ()
@property (strong,nonatomic) ATContainerViewController* containerViewController;
@end

@implementation ATViewController

- (IBAction)showFirst:(id)sender {
    [self.containerViewController showController:@"first" configurationBlock:nil];
}

- (IBAction)showSecond:(id)sender {
    [self.containerViewController showController:@"second" configurationBlock:nil];
}

- (IBAction)showThird:(id)sender {
    [self.containerViewController showController:@"third"
                              configurationBlock:^(ATThirdViewController* controller) {
                                  controller.model = @"Third";
                              }];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue
                  sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
        self.containerViewController.transitionAnimation = UIViewAnimationOptionTransitionFlipFromTop;
        [self showFirst:nil];
    }
}

@end
