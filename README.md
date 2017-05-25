# GPUImage #

## openGLES 文档
1. [OpenGLES](http://www.jianshu.com/nb/2135411)

## GPUImage 文档

1. [GPUImage详细解析](http://www.jianshu.com/p/7a58a7a61f4c)
2. [GPUImage详细解析（二）](http://www.jianshu.com/p/1eea8bf8451e)
3. [GPUImage详细解析（三）- 实时美颜滤镜](http://www.jianshu.com/p/2ce9b63ecfef)

## 美颜算法

1. [OpenCV实时美颜摄像并生成H264视频流](http://blog.csdn.net/zhangqipu000/article/details/52210391)
2. [肤色检测](http://blog.csdn.net/yangtrees/article/details/8269984)
3. [人像优化](http://blog.csdn.net/u011630458/article/details/46275469)
4. [肤色检测](http://blog.csdn.net/wj080211140/article/details/23384927)
5. [改变对比度](http://blog.csdn.net/ubunfans/article/details/24373811)

6. [YUCIHighPassSkinSmoothing](https://github.com/YuAo/YUCIHighPassSkinSmoothing)

 [滤镜说明](https://github.com/fallending/GPUImage-X/blob/master/filters.md)

## 理论依据

1. 高斯模糊（英语：Gaussian Blur）,也叫高斯平滑，是在Adobe Photoshop、GIMP以及Paint.NET等图像处理软件中广泛使用的处理效果，通常用它来减少图像噪声以及降低细节层次。

[关于高斯滤波的一些理解](http://blog.csdn.net/lz0499/article/details/54015150)
[高斯滤波器-这个我觉得讲的最好](http://blog.csdn.net/lonelyrains/article/details/46463987)

2. [图像增强-中值滤波](http://www.cnblogs.com/BYTEMAN/archive/2012/07/21/2602181.html)

3. [图像增强-图像锐化](http://www.cnblogs.com/BYTEMAN/archive/2012/07/21/2603021.html)

4. [图像分割-阈值分割](http://www.cnblogs.com/BYTEMAN/archive/2012/07/22/2603572.html)

5. [图像增强-选择式掩膜平滑](http://www.cnblogs.com/BYTEMAN/archive/2012/07/20/2601570.html)
6. [图像增强-3](http://www.cnblogs.com/BYTEMAN/archive/2012/07/20/2601281.html),[图像增强-2](http://www.cnblogs.com/BYTEMAN/archive/2012/07/20/2600625.html),[图像增强处理-1](http://www.cnblogs.com/BYTEMAN/archive/2012/07/18/2597375.html)

7. [一篇通俗易懂的讲解OpenGL ES的文章，opengles](http://www.bkjia.com/IOSjc/1089406.html)

8. [OpenGLES与IOS编程](http://blog.csdn.net/wanglang3081/article/details/9104515)

9. [CAEAGLLayer](http://blog.csdn.net/u013773524/article/details/51385127)

10. [OpenGL ES2.0 – Iphone开发指引](http://www.cnblogs.com/andyque/archive/2011/08/08/2131019.html)

## 技术需要

- OpenGL ES 2.0: Applications using this will not run on the original iPhone, iPhone 3G, and 1st and 2nd generation iPod touches
- iOS 4.1 as a deployment target (4.0 didn't have some extensions needed for movie reading). iOS 4.3 is needed as a deployment target if you wish to show live video previews when taking a still photo.
- iOS 5.0 SDK to build
- Devices must have a camera to use camera-related functionality (obviously)
- The framework uses automatic reference counting (ARC), but should support projects using both ARC and manual reference counting if added as a subproject as explained below. For manual reference counting applications targeting iOS 4.x, you'll need add -fobjc-arc to the Other Linker Flags for your application project.

## Adding the static library to your iOS project ##

Note: if you want to use this in a Swift project, you need to use the steps in the "Adding this as a framework" section instead of the following. Swift needs modules for third-party code.

Once you have the latest source code for the framework, it's fairly straightforward to add it to your application. Start by dragging the GPUImage.xcodeproj file into your application's Xcode project to embed the framework in your project. Next, go to your application's target and add GPUImage as a Target Dependency. Finally, you'll want to drag the libGPUImage.a library from the GPUImage framework's Products folder to the Link Binary With Libraries build phase in your application's target.

GPUImage needs a few other frameworks to be linked into your application, so you'll need to add the following as linked libraries in your application target:

- CoreMedia
- CoreVideo
- OpenGLES
- AVFoundation
- QuartzCore

You'll also need to find the framework headers, so within your project's build settings set the Header Search Paths to the relative path from your application to the framework/ subdirectory within the GPUImage source directory. Make this header search path recursive.

To use the GPUImage classes within your application, simply include the core framework header using the following:

    #import "GPUImage.h"

As a note: if you run into the error "Unknown class GPUImageView in Interface Builder" or the like when trying to build an interface with Interface Builder, you may need to add -ObjC to your Other Linker Flags in your project's build settings.

Also, if you need to deploy this to iOS 4.x, it appears that the current version of Xcode (4.3) requires that you weak-link the Core Video framework in your final application or you see crashes with the message "Symbol not found: _CVOpenGLESTextureCacheCreate" when you create an archive for upload to the App Store or for ad hoc distribution. To do this, go to your project's Build Phases tab, expand the Link Binary With Libraries group, and find CoreVideo.framework in the list. Change the setting for it in the far right of the list from Required to Optional.

Additionally, this is an ARC-enabled framework, so if you want to use this within a manual reference counted application targeting iOS 4.x, you'll need to add -fobjc-arc to your Other Linker Flags as well.

### Building a static library at the command line ###

If you don't want to include the project as a dependency in your application's Xcode project, you can build a universal static library for the iOS Simulator or device. To do this, run `build.sh` at the command line. The resulting library and header files will be located at `build/Release-iphone`. You may also change the version of the iOS SDK by changing the `IOSSDK_VER` variable in `build.sh` (all available versions can be found using `xcodebuild -showsdks`).

### 文档

Documentation is generated from header comments using appledoc. To build the documentation, switch to the "Documentation" scheme in Xcode. You should ensure that "APPLEDOC_PATH" (a User-Defined build setting) points to an appledoc binary, available on <a href="https://github.com/tomaz/appledoc">Github</a> or through <a href="https://github.com/Homebrew/homebrew">Homebrew</a>. It will also build and install a .docset file, which you can view with your favorite documentation tool.

## Performing common tasks ##

### 过滤实时视频

To filter live video from an iOS device's camera, you can use code like the following:

	GPUImageVideoCamera *videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionBack];
	videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
	
	GPUImageFilter *customFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromFile:@"CustomShader"];
	GPUImageView *filteredVideoView = [[GPUImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, viewWidth, viewHeight)];

	// Add the view somewhere so it's visible

	[videoCamera addTarget:customFilter];
	[customFilter addTarget:filteredVideoView];

	[videoCamera startCameraCapture];

This sets up a video source coming from the iOS device's back-facing camera, using a preset that tries to capture at 640x480. This video is captured with the interface being in portrait mode, where the landscape-left-mounted camera needs to have its video frames rotated before display. A custom filter, using code from the file CustomShader.fsh, is then set as the target for the video frames from the camera. These filtered video frames are finally displayed onscreen with the help of a UIView subclass that can present the filtered OpenGL ES texture that results from this pipeline.

The fill mode of the GPUImageView can be altered by setting its fillMode property, so that if the aspect ratio of the source video is different from that of the view, the video will either be stretched, centered with black bars, or zoomed to fill.

For blending filters and others that take in more than one image, you can create multiple outputs and add a single filter as a target for both of these outputs. The order with which the outputs are added as targets will affect the order in which the input images are blended or otherwise processed.

Also, if you wish to enable microphone audio capture for recording to a movie, you'll need to set the audioEncodingTarget of the camera to be your movie writer, like for the following:

    videoCamera.audioEncodingTarget = movieWriter;


### 捕捉、过滤静态图

To capture and filter still photos, you can use a process similar to the one for filtering video. Instead of a GPUImageVideoCamera, you use a GPUImageStillCamera:

	stillCamera = [[GPUImageStillCamera alloc] init];
	stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
	
	filter = [[GPUImageGammaFilter alloc] init];
	[stillCamera addTarget:filter];
	GPUImageView *filterView = (GPUImageView *)self.view;
	[filter addTarget:filterView];

	[stillCamera startCameraCapture];

This will give you a live, filtered feed of the still camera's preview video. Note that this preview video is only provided on iOS 4.3 and higher, so you may need to set that as your deployment target if you wish to have this functionality.

Once you want to capture a photo, you use a callback block like the following:

	[stillCamera capturePhotoProcessedUpToFilter:filter withCompletionHandler:^(UIImage *processedImage, NSError *error){
	    NSData *dataForJPEGFile = UIImageJPEGRepresentation(processedImage, 0.8);
    
	    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	    NSString *documentsDirectory = [paths objectAtIndex:0];
    
	    NSError *error2 = nil;
	    if (![dataForJPEGFile writeToFile:[documentsDirectory stringByAppendingPathComponent:@"FilteredPhoto.jpg"] options:NSAtomicWrite error:&error2])
	    {
	        return;
	    }
	}];
	
The above code captures a full-size photo processed by the same filter chain used in the preview view and saves that photo to disk as a JPEG in the application's documents directory.

Note that the framework currently can't handle images larger than 2048 pixels wide or high on older devices (those before the iPhone 4S, iPad 2, or Retina iPad) due to texture size limitations. This means that the iPhone 4, whose camera outputs still photos larger than this, won't be able to capture photos like this. A tiling mechanism is being implemented to work around this. All other devices should be able to capture and filter photos using this method.

### 处理静态图

There are a couple of ways to process a still image and create a result. The first way you can do this is by creating a still image source object and manually creating a filter chain:

	UIImage *inputImage = [UIImage imageNamed:@"Lambeau.jpg"];

	GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
	GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];

	[stillImageSource addTarget:stillImageFilter];
	[stillImageFilter useNextFrameForImageCapture];
	[stillImageSource processImage];

	UIImage *currentFilteredVideoFrame = [stillImageFilter imageFromCurrentFramebuffer];

Note that for a manual capture of an image from a filter, you need to set -useNextFrameForImageCapture in order to tell the filter that you'll be needing to capture from it later. By default, GPUImage reuses framebuffers within filters to conserve memory, so if you need to hold on to a filter's framebuffer for manual image capture, you need to let it know ahead of time. 

For single filters that you wish to apply to an image, you can simply do the following:

	GPUImageSepiaFilter *stillImageFilter2 = [[GPUImageSepiaFilter alloc] init];
	UIImage *quickFilteredImage = [stillImageFilter2 imageByFilteringImage:inputImage];


### Writing a custom filter ###

One significant advantage of this framework over Core Image on iOS (as of iOS 5.0) is the ability to write your own custom image and video processing filters. These filters are supplied as OpenGL ES 2.0 fragment shaders, written in the C-like OpenGL Shading Language. 

A custom filter is initialized with code like

	GPUImageFilter *customFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromFile:@"CustomShader"];

where the extension used for the fragment shader is .fsh. Additionally, you can use the -initWithFragmentShaderFromString: initializer to provide the fragment shader as a string, if you would not like to ship your fragment shaders in your application bundle.

Fragment shaders perform their calculations for each pixel to be rendered at that filter stage. They do this using the OpenGL Shading Language (GLSL), a C-like language with additions specific to 2-D and 3-D graphics. An example of a fragment shader is the following sepia-tone filter:

	varying highp vec2 textureCoordinate;

	uniform sampler2D inputImageTexture;

	void main()
	{
	    lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);
	    lowp vec4 outputColor;
	    outputColor.r = (textureColor.r * 0.393) + (textureColor.g * 0.769) + (textureColor.b * 0.189);
	    outputColor.g = (textureColor.r * 0.349) + (textureColor.g * 0.686) + (textureColor.b * 0.168);    
	    outputColor.b = (textureColor.r * 0.272) + (textureColor.g * 0.534) + (textureColor.b * 0.131);
		outputColor.a = 1.0;
    
		gl_FragColor = outputColor;
	}

For an image filter to be usable within the GPUImage framework, the first two lines that take in the textureCoordinate varying (for the current coordinate within the texture, normalized to 1.0) and the inputImageTexture uniform (for the actual input image frame texture) are required.

The remainder of the shader grabs the color of the pixel at this location in the passed-in texture, manipulates it in such a way as to produce a sepia tone, and writes that pixel color out to be used in the next stage of the processing pipeline.

One thing to note when adding fragment shaders to your Xcode project is that Xcode thinks they are source code files. To work around this, you'll need to manually move your shader from the Compile Sources build phase to the Copy Bundle Resources one in order to get the shader to be included in your application bundle.


### Filtering and re-encoding a movie ###

Movies can be loaded into the framework via the GPUImageMovie class, filtered, and then written out using a GPUImageMovieWriter. GPUImageMovieWriter is also fast enough to record video in realtime from an iPhone 4's camera at 640x480, so a direct filtered video source can be fed into it. Currently, GPUImageMovieWriter is fast enough to record live 720p video at up to 20 FPS on the iPhone 4, and both 720p and 1080p video at 30 FPS on the iPhone 4S (as well as on the new iPad).

The following is an example of how you would load a sample movie, pass it through a pixellation filter, then record the result to disk as a 480 x 640 h.264 movie:

	movieFile = [[GPUImageMovie alloc] initWithURL:sampleURL];
	pixellateFilter = [[GPUImagePixellateFilter alloc] init];

	[movieFile addTarget:pixellateFilter];

	NSString *pathToMovie = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Movie.m4v"];
	unlink([pathToMovie UTF8String]);
	NSURL *movieURL = [NSURL fileURLWithPath:pathToMovie];

	movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:movieURL size:CGSizeMake(480.0, 640.0)];
	[pixellateFilter addTarget:movieWriter];

    movieWriter.shouldPassthroughAudio = YES;
    movieFile.audioEncodingTarget = movieWriter;
    [movieFile enableSynchronizedEncodingUsingMovieWriter:movieWriter];

	[movieWriter startRecording];
	[movieFile startProcessing];

Once recording is finished, you need to remove the movie recorder from the filter chain and close off the recording using code like the following:

	[pixellateFilter removeTarget:movieWriter];
	[movieWriter finishRecording];

A movie won't be usable until it has been finished off, so if this is interrupted before this point, the recording will be lost.

### Interacting with OpenGL ES ###

GPUImage can both export and import textures from OpenGL ES through the use of its GPUImageTextureOutput and GPUImageTextureInput classes, respectively. This lets you record a movie from an OpenGL ES scene that is rendered to a framebuffer object with a bound texture, or filter video or images and then feed them into OpenGL ES as a texture to be displayed in the scene.

The one caution with this approach is that the textures used in these processes must be shared between GPUImage's OpenGL ES context and any other context via a share group or something similar.

