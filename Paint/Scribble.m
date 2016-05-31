//
//  Scribble.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"
#import "ScribbleMemento.h"
#import "ScribbleMemento_Friend.h"

@interface Scribble ()

@property (nonatomic, strong) id <Mark> mark;
@property (nonatomic, strong) id <Mark> incrementalMark;

@end

@implementation Scribble

@synthesize mark = _parentMark;

- (id) init
{
    if (self = [super init])
    {
        _parentMark = [[Stroke alloc] init];
    }
    
    return self;
}

#pragma mark -
#pragma mark Methods for Mark management

- (void) addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark
{
    [self willChangeValueForKey:@"mark"];
    
    if (shouldAddToPreviousMark)
    {
        [[_parentMark lastChild] addMark:aMark];
    }
    else
    {
        [_parentMark addMark:aMark];
        _incrementalMark = aMark;
    }
    
    [self didChangeValueForKey:@"mark"];
}

- (void) removeMark:(id <Mark>)aMark
{
    if (aMark == _parentMark) return;
    
    [self willChangeValueForKey:@"mark"];
    
    [_parentMark removeMark:aMark];
    
    if (aMark == _incrementalMark)
    {
        _incrementalMark = nil;
    }
    
    [self didChangeValueForKey:@"mark"];
}


#pragma mark -
#pragma mark Methods for memento

- (id) initWithMemento:(ScribbleMemento*)aMemento
{
    if (self = [super init])
    {
        if ([aMemento hasCompleteSnapshot])
        {
            [self setMark:[aMemento mark]];
        }
        else
        {
            _parentMark = [[Stroke alloc] init];
            [self attachStateFromMemento:aMemento];
        }
    }
    
    return self;
}


- (void) attachStateFromMemento:(ScribbleMemento *)memento
{
    [self addMark:[memento mark] shouldAddToPreviousMark:NO];
}


- (ScribbleMemento *) scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot
{
    id <Mark> mementoMark = _incrementalMark;
    
    if (hasCompleteSnapshot)
    {
        mementoMark = _parentMark;
    }
    else if (mementoMark == nil)
    {
        return nil;
    }
    
    ScribbleMemento *memento = [[ScribbleMemento alloc]
                                 initWithMark:mementoMark];
    [memento setHasCompleteSnapshot:hasCompleteSnapshot];
    
    return memento;
}


- (ScribbleMemento *) scribbleMemento
{
    return [self scribbleMementoWithCompleteSnapshot:YES];
}


+ (Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento
{
    Scribble *scribble = [[Scribble alloc] initWithMemento:aMemento];
    return scribble;
}


@end
