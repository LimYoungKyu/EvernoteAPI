/*
 * EvernoteTest
 * CreateNoteViewController_iPad.m
 *
 * Copyright (c) Yuichi YOSHIDA, 11/05/31
 * All rights reserved.
 * 
 * BSD License
 *
 * Redistribution and use in source and binary forms, with or without modification, are 
 * permitted provided that the following conditions are met:
 * - Redistributions of source code must retain the above copyright notice, this list of
 *  conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, this list
 *  of conditions and the following disclaimer in the documentation and/or other materia
 * ls provided with the distribution.
 * - Neither the name of the "Yuichi YOSHIDA" nor the names of its contributors may be u
 * sed to endorse or promote products derived from this software without specific prior 
 * written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY E
 * XPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES O
 * F MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SH
 * ALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENT
 * AL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROC
 * UREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS I
 * NTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRI
 * CT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF T
 * HE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "CreateNoteViewController_iPad.h"


@implementation CreateNoteViewController_iPad

#pragma mark - UIImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[self addImageToArrayWithInfo:info];
	[popOverController dismissPopoverAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[popOverController dismissPopoverAnimated:YES];
}

#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
	[popoverController autorelease];
}

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController {
	return YES;
}

#pragma mark - IBAction

- (IBAction)addImage:(id)sender {
	UIImagePickerController *controller = [[UIImagePickerController alloc] init];
	[controller setDelegate:self];
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		[controller setSourceType:UIImagePickerControllerSourceTypeCamera];
	}
	
	Class UIPopoverControllerClass = NSClassFromString(@"UIPopoverController");
	if (UIPopoverControllerClass) {
		popOverController = [[UIPopoverControllerClass alloc] initWithContentViewController:controller];
//		[popOverController presentPopoverFromRect:(sender).frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
		[popOverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
		[popOverController setDelegate:self];
	}
	[controller release];
}
@end