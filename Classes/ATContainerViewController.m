#import "ATContainerViewController.h"

@interface ATContainerViewController ()
@property (strong, nonatomic) UIViewController *current;
@property (strong, nonatomic) NSString* currentIdentifier;
@property (strong, nonatomic) NSCache* cache;
@end

@implementation ATContainerViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    [self setupContainerViewController];
    return self;
}

- (void) awakeFromNib {
    [self setupContainerViewController];
}

- (void) setupContainerViewController {
    self.transitionDuration = 0.2;
    self.transitionAnimation = UIViewAnimationOptionTransitionCrossDissolve;
    self.cache = [[NSCache alloc] init];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController* destination = [self controllerForSegue:segue
                                          configurationBlock:sender];
    [self addChildViewController:destination];
    [self fillEntireView:destination.view];
    
    if (!self.current) {
        [self showViewControllerForFirstTime:destination];
    } else {
        [self swapFromViewController:self.current toViewController:destination];
    }
    
    self.currentIdentifier = segue.identifier;
    self.current = destination;
}

- (UIViewController*)controllerForSegue:(UIStoryboardSegue *)segue
                     configurationBlock:(ATConfigurationBlock)configurationBlock {
    UIViewController* viewController = [[self cache] objectForKey:segue.identifier];
    if (!viewController) {
        viewController = segue.destinationViewController;
        if (configurationBlock) {
            configurationBlock(viewController);
        }
        [[self cache] setObject:viewController forKey:segue.identifier];
    }
    return viewController;
}

- (void)showViewControllerForFirstTime:(UIViewController *)destinationViewController {
    [self.view addSubview:destinationViewController.view];
    [destinationViewController didMoveToParentViewController:self];
}

- (void)swapFromViewController:(UIViewController *)fromViewController
              toViewController:(UIViewController *)toViewController {
    [fromViewController willMoveToParentViewController:nil];    
    [self transitionFromViewController:fromViewController
                      toViewController:toViewController
                              duration:self.transitionDuration
                               options:self.transitionAnimation
                            animations:nil completion:^(BOOL finished) {
                                [fromViewController removeFromParentViewController];
                                [toViewController didMoveToParentViewController:self];
                            }];
}

- (void)fillEntireView:(UIView *)destView {
    destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)showController:(NSString*)identifier
    configurationBlock:(ATConfigurationBlock)configurationBlock {
    if (![self.currentIdentifier isEqualToString:identifier]) {
        [self performSegueWithIdentifier:identifier sender:configurationBlock];
    }
}


@end