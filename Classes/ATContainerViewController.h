#import <Foundation/Foundation.h>

typedef void (^ATConfigurationBlock)(id viewController);


@interface ATContainerViewController : UIViewController
@property (assign,nonatomic) UIViewAnimationOptions transitionAnimation;
@property (assign,nonatomic) NSTimeInterval transitionDuration;

- (void)showController:(NSString*)identifier
    configurationBlock:(ATConfigurationBlock)configurationBlock;

@end
