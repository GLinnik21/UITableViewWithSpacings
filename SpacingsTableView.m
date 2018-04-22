#import "SpacingsTableView.h"

@implementation SpacingsTableView

@synthesize tableContentInsets = _tableContentInsets;

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style spacing:(CGFloat)spacing tableContentInsets:(UIEdgeInsets)insets
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        _rowSpacing = spacing;
        _tableContentInsets = insets;
    }
    return self;
}

- (instancetype)initWithSpacing:(CGFloat)spacing tableContentInsets:(UIEdgeInsets)insets
{
    self = [self initWithFrame:CGRectZero style:UITableViewStylePlain spacing:spacing tableContentInsets:insets];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [self initWithFrame:frame style:style spacing:0 tableContentInsets:UIEdgeInsetsZero];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame style:UITableViewStylePlain];
    return self;
}

- (instancetype)init
{
    self = [self initWithSpacing:0 tableContentInsets:UIEdgeInsetsZero];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _rowSpacing = 0.f;
        _tableContentInsets = UIEdgeInsetsZero;
    }
    return self;
}

#pragma mark - Public

- (void)setZeroSpacings
{
    self.rowSpacing = 0.f;
    self.tableContentInsets = UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
}

#pragma mark - Private shit

- (CGFloat)_rowSpacing
{
    return self.rowSpacing;
}

- (UIEdgeInsets)_tableContentInset
{
    return _tableContentInsets;
}

#pragma mark - Properties

- (void)setRowSpacing:(CGFloat)spacing
{
    _rowSpacing = spacing;
#       pragma clang diagnostic push
#       pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id rowData = [self performSelector:NSSelectorFromString(@"_rowData")];
    
    SEL aSelector = NSSelectorFromString(@"setRowSpacing:");
    
    if([rowData respondsToSelector:aSelector]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[rowData methodSignatureForSelector:aSelector]];
        [invocation setSelector:aSelector];
        [invocation setTarget:rowData];
        
        [invocation setArgument:&(spacing) atIndex:2];
        
        [invocation invoke];
    }
    [self performSelector:NSSelectorFromString(@"_updateRowData")];
#       pragma clang diagnostic pop
}

- (void)setTableContentInsets:(UIEdgeInsets)insets
{
    _tableContentInsets = UIEdgeInsetsMake(0.f, insets.left, 0.f, insets.right);

    SEL aSelector = NSSelectorFromString(@"_setDefaultLayoutMargins:");
    
    if([self respondsToSelector:aSelector]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:aSelector]];
        [invocation setSelector:aSelector];
        [invocation setTarget:self];
        
        [invocation setArgument:&(_tableContentInsets) atIndex:2];
        
        [invocation invoke];
    }
    
    self.contentInset = UIEdgeInsetsMake(insets.top, 0.f, insets.bottom, 0.f);
}

- (UIEdgeInsets)tableContentInsets {
    return UIEdgeInsetsMake(self.contentInset.top, _tableContentInsets.left, self.contentInset.bottom, _tableContentInsets.right);
}

@end
