#import <UIKit/UIKit.h>

@interface SpacingsTableView : UITableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style spacing:(CGFloat)spacing tableContentInsets:(UIEdgeInsets)insets;
- (instancetype)initWithSpacing:(CGFloat)spacing tableContentInsets:(UIEdgeInsets)insets;

@property (nonatomic, assign) CGFloat rowSpacing;
@property (nonatomic, assign) UIEdgeInsets tableContentInsets;

- (void)setZeroSpacings;

@end
