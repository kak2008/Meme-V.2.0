# Meme-V.2.0

Meme is a fun photo(Meme) sharing app.

MemeMe is a meme-generating app that enables a user to attach captions to a picture from their phone. After adding text to an image chosen from the Photo Album or Camera, the user can share it with friends. MemeMe also temporarily stores sent memes which users can browse in a table or a grid. 

User can save the memes which appear on table view cell or collection view items. user can select, edit and delete the memes. Edit option will take to editor where user can re-edit the meme and save again. If user tap on meme, meme detail view will pop up with the saved meme image.


## Installation
In order to run this app. Download the repository, open it on XCode, build & run.


### Screenshots
![alt tag](https://github.com/kak2008/Meme-V.2.0/blob/master/ScreenShots/Screen%20Shot%202016-08-04%20at%201.59.28%20AM.png)

## Implementation

- __Meme editor view controller__: - This view controller consists of image viewer and two text fields. User can take a picture either cliking the camera button or choose a picture from existing album.

- Selected image will be appeared on image viewer, where user is allowed to edit the text fields. The Meme can be saved and shared in social media such as facebook, twitter, etc.

- __Meme Collection view controller__: - This view controller consists collection of images shown in collection items. User can see them in detail, select and delete. User can add few more memes by tapping add button on top.

- __Meme Table view controller__: - This view controller consists of images(memes) shown in table view cells. User can see them in detail, select and delete. User can add few more memes by tapping add button on top.

- __Detail Meme view controller__: - This view controller consists of image viewer where it shows the memes in detail. This view controller pops up whenever user taps on the image cell in either table or collection view controller.

- Edit option on top of detail view controller will let user to edit the existing memes. 

- Save option will let user to override the existing meme with the newly modified meme.

- Application uses AVFoundation, UIKit.

## Requirements
* Xcode 7.3
* Swift 2.0

## License
Copyright (c) 2016 Anish Kodeboyina

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
