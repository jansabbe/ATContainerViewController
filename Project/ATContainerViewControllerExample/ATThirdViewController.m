#import "ATThirdViewController.h"

@interface ATThirdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ATThirdViewController
- (void) viewDidLoad {
    self.textField.text = self.model;
}
@end
