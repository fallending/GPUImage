# 滤镜

处理效果是基于GPU的，比使用CPU性能更高

## [关于开源框架GPUImage 的简单说明](http://blog.csdn.net/lu_ca/article/details/47859955)

```
#pragma mark - 色彩处理 Handle Color

#import "GPUImageBrightnessFilter.h"                //亮度
#import "GPUImageExposureFilter.h"                  //曝光
#import "GPUImageContrastFilter.h"                  //对比度
#import "GPUImageSaturationFilter.h"                //饱和度
#import "GPUImageGammaFilter.h"                     //伽马线
#import "GPUImageColorInvertFilter.h"               //反色
#import "GPUImageSepiaFilter.h"                     //褐色（怀旧）
#import "GPUImageLevelsFilter.h"                    //色阶
#import "GPUImageGrayscaleFilter.h"                 //灰度
#import "GPUImageHistogramFilter.h"                 //色彩直方图，显示在图片上
#import "GPUImageHistogramGenerator.h"              //色彩直方图
#import "GPUImageRGBFilter.h"                       //RGB
#import "GPUImageToneCurveFilter.h"                 //色调曲线
#import "GPUImageMonochromeFilter.h"                //单色
#import "GPUImageOpacityFilter.h"                   //不透明度
#import "GPUImageHighlightShadowFilter.h"           //提亮阴影
#import "GPUImageFalseColorFilter.h"                //色彩替换（替换亮部和暗部色彩）
#import "GPUImageHueFilter.h"                       //色度
#import "GPUImageChromaKeyFilter.h"                 //色度键
#import "GPUImageWhiteBalanceFilter.h"              //白平横
#import "GPUImageAverageColor.h"                    //像素平均色值
#import "GPUImageSolidColorGenerator.h"             //纯色
#import "GPUImageLuminosity.h"                      //亮度平均
#import "GPUImageAverageLuminanceThresholdFilter.h" //像素色值亮度平均，图像黑白（有类似漫画效果）
#import "GPUImageLookupFilter.h"                    //lookup 色彩调整
#import "GPUImageAmatorkaFilter.h"                  //Amatorka lookup
#import "GPUImageMissEtikateFilter.h"               //MissEtikate lookup
#import "GPUImageSoftEleganceFilter.h"              //SoftElegance lookup

#pragma mark - 图像处理 Handle Image

#import "GPUImageCrosshairGenerator.h"              //十字
#import "GPUImageLineGenerator.h"                   //线条
#import "GPUImageTransformFilter.h"                 //形状变化
#import "GPUImageCropFilter.h"                      //剪裁
#import "GPUImageSharpenFilter.h"                   //锐化
#import "GPUImageUnsharpMaskFilter.h"               //反遮罩锐化
#import "GPUImageFastBlurFilter.h"                  //模糊
#import "GPUImageGaussianBlurFilter.h"              //高斯模糊
#import "GPUImageGaussianSelectiveBlurFilter.h"     //高斯模糊，选择部分清晰
#import "GPUImageBoxBlurFilter.h"                   //盒状模糊
#import "GPUImageTiltShiftFilter.h"                 //条纹模糊，中间清晰，上下两端模糊
#import "GPUImageMedianFilter.h"                    //中间值，有种稍微模糊边缘的效果
#import "GPUImageBilateralFilter.h"                 //双边模糊
#import "GPUImageErosionFilter.h"                   //侵蚀边缘模糊，变黑白
#import "GPUImageRGBErosionFilter.h"                //RGB侵蚀边缘模糊，有色彩
#import "GPUImageDilationFilter.h"                  //扩展边缘模糊，变黑白
#import "GPUImageRGBDilationFilter.h"               //RGB扩展边缘模糊，有色彩
#import "GPUImageOpeningFilter.h"                   //黑白色调模糊
#import "GPUImageRGBOpeningFilter.h"                //彩色模糊
#import "GPUImageClosingFilter.h"                   //黑白色调模糊，暗色会被提亮
#import "GPUImageRGBClosingFilter.h"                //彩色模糊，暗色会被提亮
#import "GPUImageLanczosResamplingFilter.h"         //Lanczos重取样，模糊效果
#import "GPUImageNonMaximumSuppressionFilter.h"     //非最大抑制，只显示亮度最高的像素，其他为黑
#import "GPUImageThresholdedNonMaximumSuppressionFilter.h" //与上相比，像素丢失更多
#import "GPUImageSobelEdgeDetectionFilter.h"        //Sobel边缘检测算法(白边，黑内容，有点漫画的反色效果)
#import "GPUImageCannyEdgeDetectionFilter.h"        //Canny边缘检测算法（比上更强烈的黑白对比度）
#import "GPUImageThresholdEdgeDetectionFilter.h"    //阈值边缘检测（效果与上差别不大）
#import "GPUImagePrewittEdgeDetectionFilter.h"      //普瑞维特(Prewitt)边缘检测(效果与Sobel差不多，貌似更平滑)
#import "GPUImageXYDerivativeFilter.h"              //XYDerivative边缘检测，画面以蓝色为主，绿色为边缘，带彩色
#import "GPUImageHarrisCornerDetectionFilter.h"     //Harris角点检测，会有绿色小十字显示在图片角点处
#import "GPUImageNobleCornerDetectionFilter.h"      //Noble角点检测，检测点更多
#import "GPUImageShiTomasiFeatureDetectionFilter.h" //ShiTomasi角点检测，与上差别不大
#import "GPUImageMotionDetector.h"                  //动作检测
#import "GPUImageHoughTransformLineDetector.h"      //线条检测
#import "GPUImageParallelCoordinateLineTransformFilter.h" //平行线检测
#import "GPUImageLocalBinaryPatternFilter.h"        //图像黑白化，并有大量噪点
#import "GPUImageLowPassFilter.h"                   //用于图像加亮
#import "GPUImageHighPassFilter.h"                  //图像低于某值时显示为黑

#pragma mark - 视觉效果 Visual Effect

#import "GPUImageSketchFilter.h"                    //素描
#import "GPUImageThresholdSketchFilter.h"           //阀值素描，形成有噪点的素描
#import "GPUImageToonFilter.h"                      //卡通效果（黑色粗线描边）
#import "GPUImageSmoothToonFilter.h"                //相比上面的效果更细腻，上面是粗旷的画风
#import "GPUImageKuwaharaFilter.h"                  //桑原(Kuwahara)滤波,水粉画的模糊效果；处理时间比较长，慎用
#import "GPUImageMosaicFilter.h"                    //黑白马赛克
#import "GPUImagePixellateFilter.h"                 //像素化
#import "GPUImagePolarPixellateFilter.h"            //同心圆像素化
#import "GPUImageCrosshatchFilter.h"                //交叉线阴影，形成黑白网状画面
#import "GPUImageColorPackingFilter.h"              //色彩丢失，模糊（类似监控摄像效果）
#import "GPUImageVignetteFilter.h"                  //晕影，形成黑色圆形边缘，突出中间图像的效果
#import "GPUImageSwirlFilter.h"                     //漩涡，中间形成卷曲的画面
#import "GPUImageBulgeDistortionFilter.h"           //凸起失真，鱼眼效果
#import "GPUImagePinchDistortionFilter.h"           //收缩失真，凹面镜
#import "GPUImageStretchDistortionFilter.h"         //伸展失真，哈哈镜
#import "GPUImageGlassSphereFilter.h"               //水晶球效果
#import "GPUImageSphereRefractionFilter.h"          //球形折射，图形倒立
#import "GPUImagePosterizeFilter.h"                 //色调分离，形成噪点效果
#import "GPUImageCGAColorspaceFilter.h"             //CGA色彩滤镜，形成黑、浅蓝、紫色块的画面
#import "GPUImagePerlinNoiseFilter.h"               //柏林噪点，花边噪点
#import "GPUImage3x3ConvolutionFilter.h"            //3x3卷积，高亮大色块变黑，加亮边缘、线条等
#import "GPUImageEmbossFilter.h"                    //浮雕效果，带有点3d的感觉
#import "GPUImagePolkaDotFilter.h"                  //像素圆点花样
#import "GPUImageHalftoneFilter.h"                  //点染,图像黑白化，由黑点构成原图的大致图形

#pragma mark - 混合模式 Blend

#import "GPUImageMultiplyBlendFilter.h"             //通常用于创建阴影和深度效果
#import "GPUImageNormalBlendFilter.h"               //正常
#import "GPUImageAlphaBlendFilter.h"                //透明混合,通常用于在背景上应用前景的透明度
#import "GPUImageDissolveBlendFilter.h"             //溶解
#import "GPUImageOverlayBlendFilter.h"              //叠加,通常用于创建阴影效果
#import "GPUImageDarkenBlendFilter.h"               //加深混合,通常用于重叠类型
#import "GPUImageLightenBlendFilter.h"              //减淡混合,通常用于重叠类型
#import "GPUImageSourceOverBlendFilter.h"           //源混合
#import "GPUImageColorBurnBlendFilter.h"            //色彩加深混合
#import "GPUImageColorDodgeBlendFilter.h"           //色彩减淡混合
#import "GPUImageScreenBlendFilter.h"               //屏幕包裹,通常用于创建亮点和镜头眩光
#import "GPUImageExclusionBlendFilter.h"            //排除混合
#import "GPUImageDifferenceBlendFilter.h"           //差异混合,通常用于创建更多变动的颜色
#import "GPUImageSubtractBlendFilter.h"             //差值混合,通常用于创建两个图像之间的动画变暗模糊效果
#import "GPUImageHardLightBlendFilter.h"            //强光混合,通常用于创建阴影效果
#import "GPUImageSoftLightBlendFilter.h"            //柔光混合
#import "GPUImageChromaKeyBlendFilter.h"            //色度键混合
#import "GPUImageMaskFilter.h"                      //遮罩混合
#import "GPUImageHazeFilter.h"                      //朦胧加暗
#import "GPUImageLuminanceThresholdFilter.h"        //亮度阈
#import "GPUImageAdaptiveThresholdFilter.h"         //自适应阈值
#import "GPUImageAddBlendFilter.h"                  //通常用于创建两个图像之间的动画变亮模糊效果
#import "GPUImageDivideBlendFilter.h"               //通常用于创建两个图像之间的动画变暗模糊效果

#pragma mark - 尚不清楚

#import "GPUImageJFAVoroniFilter.h"
#import "GPUImageVoroniConsumerFilter.h"
```

## Built-in filters ##

There are currently 125 built-in filters, divided into the following categories:

### Color adjustments ###

- **GPUImageBrightnessFilter**: Adjusts the brightness of the image
  - *brightness*: The adjusted brightness (-1.0 - 1.0, with 0.0 as the default)

- **GPUImageExposureFilter**: Adjusts the exposure of the image
  - *exposure*: The adjusted exposure (-10.0 - 10.0, with 0.0 as the default)

- **GPUImageContrastFilter**: Adjusts the contrast of the image
  - *contrast*: The adjusted contrast (0.0 - 4.0, with 1.0 as the default)

- **GPUImageSaturationFilter**: Adjusts the saturation of an image
  - *saturation*: The degree of saturation or desaturation to apply to the image (0.0 - 2.0, with 1.0 as the default)

- **GPUImageGammaFilter**: Adjusts the gamma of an image
  - *gamma*: The gamma adjustment to apply (0.0 - 3.0, with 1.0 as the default)

- **GPUImageLevelsFilter**: Photoshop-like levels adjustment. The min, max, minOut and maxOut parameters are floats in the range [0, 1]. If you have parameters from Photoshop in the range [0, 255] you must first convert them to be [0, 1]. The gamma/mid parameter is a float >= 0. This matches the value from Photoshop. If you want to apply levels to RGB as well as individual channels you need to use this filter twice - first for the individual channels and then for all channels.

- **GPUImageColorMatrixFilter**: Transforms the colors of an image by applying a matrix to them
  - *colorMatrix*: A 4x4 matrix used to transform each color in an image
  - *intensity*: The degree to which the new transformed color replaces the original color for each pixel

- **GPUImageRGBFilter**: Adjusts the individual RGB channels of an image
  - *red*: Normalized values by which each color channel is multiplied. The range is from 0.0 up, with 1.0 as the default.
  - *green*: 
  - *blue*:

- **GPUImageHueFilter**: Adjusts the hue of an image
  - *hue*: The hue angle, in degrees. 90 degrees by default

- **GPUImageVibranceFilter**: Adjusts the vibrance of an image
  - *vibrance*: The vibrance adjustment to apply, using 0.0 as the default, and a suggested min/max of around -1.2 and 1.2, respectively.

- **GPUImageWhiteBalanceFilter**: Adjusts the white balance of an image.
  - *temperature*: The temperature to adjust the image by, in ºK. A value of 4000 is very cool and 7000 very warm. The default value is 5000. Note that the scale between 4000 and 5000 is nearly as visually significant as that between 5000 and 7000.
  - *tint*: The tint to adjust the image by. A value of -200 is *very* green and 200 is *very* pink. The default value is 0.  

- **GPUImageToneCurveFilter**: Adjusts the colors of an image based on spline curves for each color channel.
  - *redControlPoints*:
  - *greenControlPoints*:
  - *blueControlPoints*: 
  - *rgbCompositeControlPoints*: The tone curve takes in a series of control points that define the spline curve for each color component, or for all three in the composite. These are stored as NSValue-wrapped CGPoints in an NSArray, with normalized X and Y coordinates from 0 - 1. The defaults are (0,0), (0.5,0.5), (1,1).

- **GPUImageHighlightShadowFilter**: Adjusts the shadows and highlights of an image
  - *shadows*: Increase to lighten shadows, from 0.0 to 1.0, with 0.0 as the default.
  - *highlights*: Decrease to darken highlights, from 1.0 to 0.0, with 1.0 as the default.

- **GPUImageHighlightShadowTintFilter**: Allows you to tint the shadows and highlights of an image independently using a color and intensity
  - *shadowTintColor*: Shadow tint RGB color (GPUVector4). Default: `{1.0f, 0.0f, 0.0f, 1.0f}` (red).
  - *highlightTintColor*: Highlight tint RGB color (GPUVector4). Default: `{0.0f, 0.0f, 1.0f, 1.0f}` (blue).
  - *shadowTintIntensity*: Shadow tint intensity, from 0.0 to 1.0. Default: 0.0
  - *highlightTintIntensity*: Highlight tint intensity, from 0.0 to 1.0, with 0.0 as the default.

- **GPUImageLookupFilter**: Uses an RGB color lookup image to remap the colors in an image. First, use your favourite photo editing application to apply a filter to lookup.png from GPUImage/framework/Resources. For this to work properly each pixel color must not depend on other pixels (e.g. blur will not work). If you need a more complex filter you can create as many lookup tables as required. Once ready, use your new lookup.png file as a second input for GPUImageLookupFilter.

- **GPUImageAmatorkaFilter**: A photo filter based on a Photoshop action by Amatorka: http://amatorka.deviantart.com/art/Amatorka-Action-2-121069631 . If you want to use this effect you have to add lookup_amatorka.png from the GPUImage Resources folder to your application bundle.

- **GPUImageMissEtikateFilter**: A photo filter based on a Photoshop action by Miss Etikate: http://miss-etikate.deviantart.com/art/Photoshop-Action-15-120151961 . If you want to use this effect you have to add lookup_miss_etikate.png from the GPUImage Resources folder to your application bundle.

- **GPUImageSoftEleganceFilter**: Another lookup-based color remapping filter. If you want to use this effect you have to add lookup_soft_elegance_1.png and lookup_soft_elegance_2.png from the GPUImage Resources folder to your application bundle.

- **GPUImageSkinToneFilter**: A skin-tone adjustment filter that affects a unique range of light skin-tone colors and adjusts the pink/green or pink/orange range accordingly. Default values are targetted at fair caucasian skin, but can be adjusted as required.
  - *skinToneAdjust*: Amount to adjust skin tone. Default: 0.0, suggested min/max: -0.3 and 0.3 respectively.
  - *skinHue*: Skin hue to be detected. Default: 0.05 (fair caucasian to reddish skin).
  - *skinHueThreshold*: Amount of variance in skin hue. Default: 40.0.
  - *maxHueShift*: Maximum amount of hue shifting allowed. Default: 0.25.
  - *maxSaturationShift* = Maximum amount of saturation to be shifted (when using orange). Default: 0.4.
  - *upperSkinToneColor* = `GPUImageSkinToneUpperColorGreen` or `GPUImageSkinToneUpperColorOrange`
    
- **GPUImageColorInvertFilter**: Inverts the colors of an image

- **GPUImageGrayscaleFilter**: Converts an image to grayscale (a slightly faster implementation of the saturation filter, without the ability to vary the color contribution)

- **GPUImageMonochromeFilter**: Converts the image to a single-color version, based on the luminance of each pixel
  - *intensity*: The degree to which the specific color replaces the normal image color (0.0 - 1.0, with 1.0 as the default)
  - *color*: The color to use as the basis for the effect, with (0.6, 0.45, 0.3, 1.0) as the default.

- **GPUImageFalseColorFilter**: Uses the luminance of the image to mix between two user-specified colors
  - *firstColor*: The first and second colors specify what colors replace the dark and light areas of the image, respectively. The defaults are (0.0, 0.0, 0.5) amd (1.0, 0.0, 0.0).
  - *secondColor*: 

- **GPUImageHazeFilter**: Used to add or remove haze (similar to a UV filter)
  - *distance*: Strength of the color applied. Default 0. Values between -.3 and .3 are best.
  - *slope*: Amount of color change. Default 0. Values between -.3 and .3 are best.

- **GPUImageSepiaFilter**: Simple sepia tone filter
  - *intensity*: The degree to which the sepia tone replaces the normal image color (0.0 - 1.0, with 1.0 as the default)

- **GPUImageOpacityFilter**: Adjusts the alpha channel of the incoming image
  - *opacity*: The value to multiply the incoming alpha channel for each pixel by (0.0 - 1.0, with 1.0 as the default)

- **GPUImageSolidColorGenerator**: This outputs a generated image with a solid color. You need to define the image size using -forceProcessingAtSize:
  - *color*: The color, in a four component format, that is used to fill the image.

- **GPUImageLuminanceThresholdFilter**: Pixels with a luminance above the threshold will appear white, and those below will be black
  - *threshold*: The luminance threshold, from 0.0 to 1.0, with a default of 0.5

- **GPUImageAdaptiveThresholdFilter**: Determines the local luminance around a pixel, then turns the pixel black if it is below that local luminance and white if above. This can be useful for picking out text under varying lighting conditions.
  - *blurRadiusInPixels*: A multiplier for the background averaging blur radius in pixels, with a default of 4.

- **GPUImageAverageLuminanceThresholdFilter**: This applies a thresholding operation where the threshold is continually adjusted based on the average luminance of the scene.
  - *thresholdMultiplier*: This is a factor that the average luminance will be multiplied by in order to arrive at the final threshold to use. By default, this is 1.0.

- **GPUImageHistogramFilter**: This analyzes the incoming image and creates an output histogram with the frequency at which each color value occurs. The output of this filter is a 3-pixel-high, 256-pixel-wide image with the center (vertical) pixels containing pixels that correspond to the frequency at which various color values occurred. Each color value occupies one of the 256 width positions, from 0 on the left to 255 on the right. This histogram can be generated for individual color channels (kGPUImageHistogramRed, kGPUImageHistogramGreen, kGPUImageHistogramBlue), the luminance of the image (kGPUImageHistogramLuminance), or for all three color channels at once (kGPUImageHistogramRGB).
  - *downsamplingFactor*: Rather than sampling every pixel, this dictates what fraction of the image is sampled. By default, this is 16 with a minimum of 1. This is needed to keep from saturating the histogram, which can only record 256 pixels for each color value before it becomes overloaded.

- **GPUImageHistogramGenerator**: This is a special filter, in that it's primarily intended to work with the GPUImageHistogramFilter. It generates an output representation of the color histograms generated by GPUImageHistogramFilter, but it could be repurposed to display other kinds of values. It takes in an image and looks at the center (vertical) pixels. It then plots the numerical values of the RGB components in separate colored graphs in an output texture. You may need to force a size for this filter in order to make its output visible.

- **GPUImageAverageColor**: This processes an input image and determines the average color of the scene, by averaging the RGBA components for each pixel in the image. A reduction process is used to progressively downsample the source image on the GPU, followed by a short averaging calculation on the CPU. The output from this filter is meaningless, but you need to set the colorAverageProcessingFinishedBlock property to a block that takes in four color components and a frame time and does something with them.

- **GPUImageLuminosity**: Like the GPUImageAverageColor, this reduces an image to its average luminosity. You need to set the luminosityProcessingFinishedBlock to handle the output of this filter, which just returns a luminosity value and a frame time.

- **GPUImageChromaKeyFilter**: For a given color in the image, sets the alpha channel to 0. This is similar to the GPUImageChromaKeyBlendFilter, only instead of blending in a second image for a matching color this doesn't take in a second image and just turns a given color transparent.
  - *thresholdSensitivity*: How close a color match needs to exist to the target color to be replaced (default of 0.4)
  - *smoothing*: How smoothly to blend for the color match (default of 0.1)

### Image processing ###

- **GPUImageTransformFilter**: This applies an arbitrary 2-D or 3-D transformation to an image
  - *affineTransform*: This takes in a CGAffineTransform to adjust an image in 2-D
  - *transform3D*: This takes in a CATransform3D to manipulate an image in 3-D
  - *ignoreAspectRatio*: By default, the aspect ratio of the transformed image is maintained, but this can be set to YES to make the transformation independent of aspect ratio

- **GPUImageCropFilter**: This crops an image to a specific region, then passes only that region on to the next stage in the filter
  - *cropRegion*: A rectangular area to crop out of the image, normalized to coordinates from 0.0 - 1.0. The (0.0, 0.0) position is in the upper left of the image.

- **GPUImageLanczosResamplingFilter**: This lets you up- or downsample an image using Lanczos resampling, which results in noticeably better quality than the standard linear or trilinear interpolation. Simply use -forceProcessingAtSize: to set the target output resolution for the filter, and the image will be resampled for that new size.

- **GPUImageSharpenFilter**: Sharpens the image
  - *sharpness*: The sharpness adjustment to apply (-4.0 - 4.0, with 0.0 as the default)

- **GPUImageUnsharpMaskFilter**: Applies an unsharp mask
  - *blurRadiusInPixels*: The blur radius of the underlying Gaussian blur. The default is 4.0.
  - *intensity*: The strength of the sharpening, from 0.0 on up, with a default of 1.0

- **GPUImageGaussianBlurFilter**: A hardware-optimized, variable-radius Gaussian blur
  - *texelSpacingMultiplier*: A multiplier for the spacing between texels, ranging from 0.0 on up, with a default of 1.0. Adjusting this may slightly increase the blur strength, but will introduce artifacts in the result. Highly recommend using other parameters first, before touching this one.
  - *blurRadiusInPixels*: A radius in pixels to use for the blur, with a default of 2.0. This adjusts the sigma variable in the Gaussian distribution function.
  - *blurRadiusAsFractionOfImageWidth*: 
  - *blurRadiusAsFractionOfImageHeight*: Setting these properties will allow the blur radius to scale with the size of the image
  - *blurPasses*: The number of times to sequentially blur the incoming image. The more passes, the slower the filter.

- **GPUImageBoxBlurFilter**: A hardware-optimized, variable-radius box blur
  - *texelSpacingMultiplier*: A multiplier for the spacing between texels, ranging from 0.0 on up, with a default of 1.0. Adjusting this may slightly increase the blur strength, but will introduce artifacts in the result. Highly recommend using other parameters first, before touching this one.
  - *blurRadiusInPixels*: A radius in pixels to use for the blur, with a default of 2.0. This adjusts the sigma variable in the Gaussian distribution function.
  - *blurRadiusAsFractionOfImageWidth*: 
  - *blurRadiusAsFractionOfImageHeight*: Setting these properties will allow the blur radius to scale with the size of the image
  - *blurPasses*: The number of times to sequentially blur the incoming image. The more passes, the slower the filter.

- **GPUImageSingleComponentGaussianBlurFilter**: A modification of the GPUImageGaussianBlurFilter that operates only on the red component
  - *texelSpacingMultiplier*: A multiplier for the spacing between texels, ranging from 0.0 on up, with a default of 1.0. Adjusting this may slightly increase the blur strength, but will introduce artifacts in the result. Highly recommend using other parameters first, before touching this one.
  - *blurRadiusInPixels*: A radius in pixels to use for the blur, with a default of 2.0. This adjusts the sigma variable in the Gaussian distribution function.
  - *blurRadiusAsFractionOfImageWidth*: 
  - *blurRadiusAsFractionOfImageHeight*: Setting these properties will allow the blur radius to scale with the size of the image
  - *blurPasses*: The number of times to sequentially blur the incoming image. The more passes, the slower the filter.

- **GPUImageGaussianSelectiveBlurFilter**: A Gaussian blur that preserves focus within a circular region
  - *blurRadiusInPixels*: A radius in pixels to use for the blur, with a default of 5.0. This adjusts the sigma variable in the Gaussian distribution function.
  - *excludeCircleRadius*: The radius of the circular area being excluded from the blur
  - *excludeCirclePoint*: The center of the circular area being excluded from the blur
  - *excludeBlurSize*: The size of the area between the blurred portion and the clear circle 
  - *aspectRatio*: The aspect ratio of the image, used to adjust the circularity of the in-focus region. By default, this matches the image aspect ratio, but you can override this value.

- **GPUImageGaussianBlurPositionFilter**: The inverse of the GPUImageGaussianSelectiveBlurFilter, applying the blur only within a certain circle
  - *blurSize*: A multiplier for the size of the blur, ranging from 0.0 on up, with a default of 1.0
  - *blurCenter*: Center for the blur, defaults to 0.5, 0.5
  - *blurRadius*: Radius for the blur, defaults to 1.0

- **GPUImageiOSBlurFilter**: An attempt to replicate the background blur used on iOS 7 in places like the control center.
  - *blurRadiusInPixels*: A radius in pixels to use for the blur, with a default of 12.0. This adjusts the sigma variable in the Gaussian distribution function.
  - *saturation*: Saturation ranges from 0.0 (fully desaturated) to 2.0 (max saturation), with 0.8 as the normal level
  - *downsampling*: The degree to which to downsample, then upsample the incoming image to minimize computations within the Gaussian blur, with a default of 4.0.

- **GPUImageMedianFilter**: Takes the median value of the three color components, over a 3x3 area

- **GPUImageBilateralFilter**: A bilateral blur, which tries to blur similar color values while preserving sharp edges
  - *texelSpacingMultiplier*: A multiplier for the spacing between texel reads, ranging from 0.0 on up, with a default of 4.0
  - *distanceNormalizationFactor*: A normalization factor for the distance between central color and sample color, with a default of 8.0.

- **GPUImageTiltShiftFilter**: A simulated tilt shift lens effect
  - *blurRadiusInPixels*: The radius of the underlying blur, in pixels. This is 7.0 by default.
  - *topFocusLevel*: The normalized location of the top of the in-focus area in the image, this value should be lower than bottomFocusLevel, default 0.4
  - *bottomFocusLevel*: The normalized location of the bottom of the in-focus area in the image, this value should be higher than topFocusLevel, default 0.6
  - *focusFallOffRate*: The rate at which the image gets blurry away from the in-focus region, default 0.2

- **GPUImage3x3ConvolutionFilter**: Runs a 3x3 convolution kernel against the image
  - *convolutionKernel*: The convolution kernel is a 3x3 matrix of values to apply to the pixel and its 8 surrounding pixels. The matrix is specified in row-major order, with the top left pixel being one.one and the bottom right three.three. If the values in the matrix don't add up to 1.0, the image could be brightened or darkened.

- **GPUImageSobelEdgeDetectionFilter**: Sobel edge detection, with edges highlighted in white
  - *texelWidth*: 
  - *texelHeight*: These parameters affect the visibility of the detected edges
  - *edgeStrength*: Adjusts the dynamic range of the filter. Higher values lead to stronger edges, but can saturate the intensity colorspace. Default is 1.0.

- **GPUImagePrewittEdgeDetectionFilter**: Prewitt edge detection, with edges highlighted in white
  - *texelWidth*: 
  - *texelHeight*: These parameters affect the visibility of the detected edges
  - *edgeStrength*: Adjusts the dynamic range of the filter. Higher values lead to stronger edges, but can saturate the intensity colorspace. Default is 1.0.

- **GPUImageThresholdEdgeDetectionFilter**: Performs Sobel edge detection, but applies a threshold instead of giving gradual strength values
  - *texelWidth*: 
  - *texelHeight*: These parameters affect the visibility of the detected edges
  - *edgeStrength*: Adjusts the dynamic range of the filter. Higher values lead to stronger edges, but can saturate the intensity colorspace. Default is 1.0.
  - *threshold*: Any edge above this threshold will be black, and anything below white. Ranges from 0.0 to 1.0, with 0.8 as the default

- **GPUImageCannyEdgeDetectionFilter**: This uses the full Canny process to highlight one-pixel-wide edges
  - *texelWidth*: 
  - *texelHeight*: These parameters affect the visibility of the detected edges
  - *blurRadiusInPixels*: The underlying blur radius for the Gaussian blur. Default is 2.0.
  - *blurTexelSpacingMultiplier*: The underlying blur texel spacing multiplier. Default is 1.0.
  - *upperThreshold*: Any edge with a gradient magnitude above this threshold will pass and show up in the final result. Default is 0.4.
  - *lowerThreshold*: Any edge with a gradient magnitude below this threshold will fail and be removed from the final result. Default is 0.1.

- **GPUImageHarrisCornerDetectionFilter**: Runs the Harris corner detection algorithm on an input image, and produces an image with those corner points as white pixels and everything else black. The cornersDetectedBlock can be set, and you will be provided with a list of corners (in normalized 0..1 X, Y coordinates) within that callback for whatever additional operations you want to perform.
  - *blurRadiusInPixels*: The radius of the underlying Gaussian blur. The default is 2.0.
  - *sensitivity*: An internal scaling factor applied to adjust the dynamic range of the cornerness maps generated in the filter. The default is 5.0.
  - *threshold*: The threshold at which a point is detected as a corner. This can vary significantly based on the size, lighting conditions, and iOS device camera type, so it might take a little experimentation to get right for your cases. Default is 0.20.

- **GPUImageNobleCornerDetectionFilter**: Runs the Noble variant on the Harris corner detector. It behaves as described above for the Harris detector.
  - *blurRadiusInPixels*: The radius of the underlying Gaussian blur. The default is 2.0.
  - *sensitivity*: An internal scaling factor applied to adjust the dynamic range of the cornerness maps generated in the filter. The default is 5.0.
  - *threshold*: The threshold at which a point is detected as a corner. This can vary significantly based on the size, lighting conditions, and iOS device camera type, so it might take a little experimentation to get right for your cases. Default is 0.2.

- **GPUImageShiTomasiCornerDetectionFilter**: Runs the Shi-Tomasi feature detector. It behaves as described above for the Harris detector.
  - *blurRadiusInPixels*: The radius of the underlying Gaussian blur. The default is 2.0.
  - *sensitivity*: An internal scaling factor applied to adjust the dynamic range of the cornerness maps generated in the filter. The default is 1.5.
  - *threshold*: The threshold at which a point is detected as a corner. This can vary significantly based on the size, lighting conditions, and iOS device camera type, so it might take a little experimentation to get right for your cases. Default is 0.2.

- **GPUImageNonMaximumSuppressionFilter**: Currently used only as part of the Harris corner detection filter, this will sample a 1-pixel box around each pixel and determine if the center pixel's red channel is the maximum in that area. If it is, it stays. If not, it is set to 0 for all color components.

- **GPUImageXYDerivativeFilter**: An internal component within the Harris corner detection filter, this calculates the squared difference between the pixels to the left and right of this one, the squared difference of the pixels above and below this one, and the product of those two differences.

- **GPUImageCrosshairGenerator**: This draws a series of crosshairs on an image, most often used for identifying machine vision features. It does not take in a standard image like other filters, but a series of points in its -renderCrosshairsFromArray:count: method, which does the actual drawing. You will need to force this filter to render at the particular output size you need.
  - *crosshairWidth*: The width, in pixels, of the crosshairs to be drawn onscreen.

- **GPUImageDilationFilter**: This performs an image dilation operation, where the maximum intensity of the red channel in a rectangular neighborhood is used for the intensity of this pixel. The radius of the rectangular area to sample over is specified on initialization, with a range of 1-4 pixels. This is intended for use with grayscale images, and it expands bright regions.

- **GPUImageRGBDilationFilter**: This is the same as the GPUImageDilationFilter, except that this acts on all color channels, not just the red channel.

- **GPUImageErosionFilter**: This performs an image erosion operation, where the minimum intensity of the red channel in a rectangular neighborhood is used for the intensity of this pixel. The radius of the rectangular area to sample over is specified on initialization, with a range of 1-4 pixels. This is intended for use with grayscale images, and it expands dark regions.

- **GPUImageRGBErosionFilter**: This is the same as the GPUImageErosionFilter, except that this acts on all color channels, not just the red channel.

- **GPUImageOpeningFilter**: This performs an erosion on the red channel of an image, followed by a dilation of the same radius. The radius is set on initialization, with a range of 1-4 pixels. This filters out smaller bright regions.

- **GPUImageRGBOpeningFilter**: This is the same as the GPUImageOpeningFilter, except that this acts on all color channels, not just the red channel.

- **GPUImageClosingFilter**: This performs a dilation on the red channel of an image, followed by an erosion of the same radius. The radius is set on initialization, with a range of 1-4 pixels. This filters out smaller dark regions.

- **GPUImageRGBClosingFilter**: This is the same as the GPUImageClosingFilter, except that this acts on all color channels, not just the red channel.

- **GPUImageLocalBinaryPatternFilter**: This performs a comparison of intensity of the red channel of the 8 surrounding pixels and that of the central one, encoding the comparison results in a bit string that becomes this pixel intensity. The least-significant bit is the top-right comparison, going counterclockwise to end at the right comparison as the most significant bit.

- **GPUImageLowPassFilter**: This applies a low pass filter to incoming video frames. This basically accumulates a weighted rolling average of previous frames with the current ones as they come in. This can be used to denoise video, add motion blur, or be used to create a high pass filter.
  - *filterStrength*: This controls the degree by which the previous accumulated frames are blended with the current one. This ranges from 0.0 to 1.0, with a default of 0.5.

- **GPUImageHighPassFilter**: This applies a high pass filter to incoming video frames. This is the inverse of the low pass filter, showing the difference between the current frame and the weighted rolling average of previous ones. This is most useful for motion detection.
  - *filterStrength*: This controls the degree by which the previous accumulated frames are blended and then subtracted from the current one. This ranges from 0.0 to 1.0, with a default of 0.5.

- **GPUImageMotionDetector**: This is a motion detector based on a high-pass filter. You set the motionDetectionBlock and on every incoming frame it will give you the centroid of any detected movement in the scene (in normalized X,Y coordinates) as well as an intensity of motion for the scene.
  - *lowPassFilterStrength*: This controls the strength of the low pass filter used behind the scenes to establish the baseline that incoming frames are compared with. This ranges from 0.0 to 1.0, with a default of 0.5.

- **GPUImageHoughTransformLineDetector**: Detects lines in the image using a Hough transform into parallel coordinate space. This approach is based entirely on the PC lines process developed by the Graph@FIT research group at the Brno University of Technology and described in their publications: M. Dubská, J. Havel, and A. Herout. Real-Time Detection of Lines using Parallel Coordinates and OpenGL. Proceedings of SCCG 2011, Bratislava, SK, p. 7 (http://medusa.fit.vutbr.cz/public/data/papers/2011-SCCG-Dubska-Real-Time-Line-Detection-Using-PC-and-OpenGL.pdf) and M. Dubská, J. Havel, and A. Herout. PClines — Line detection using parallel coordinates. 2011 IEEE Conference on Computer Vision and Pattern Recognition (CVPR), p. 1489- 1494 (http://medusa.fit.vutbr.cz/public/data/papers/2011-CVPR-Dubska-PClines.pdf).
  - *edgeThreshold*: A threshold value for which a point is detected as belonging to an edge for determining lines. Default is 0.9.
  - *lineDetectionThreshold*: A threshold value for which a local maximum is detected as belonging to a line in parallel coordinate space. Default is 0.20.
  - *linesDetectedBlock*: This block is called on the detection of lines, usually on every processed frame. A C array containing normalized slopes and intercepts in m, b pairs (y=mx+b) is passed in, along with a count of the number of lines detected and the current timestamp of the video frame.

- **GPUImageLineGenerator**: A helper class that generates lines which can overlay the scene. The color of these lines can be adjusted using -setLineColorRed:green:blue:
  - *lineWidth*: The width of the lines, in pixels, with a default of 1.0.

- **GPUImageMotionBlurFilter**: Applies a directional motion blur to an image
  - *blurSize*: A multiplier for the blur size, ranging from 0.0 on up, with a default of 1.0
  - *blurAngle*: The angular direction of the blur, in degrees. 0 degrees by default.

- **GPUImageZoomBlurFilter**: Applies a directional motion blur to an image
  - *blurSize*: A multiplier for the blur size, ranging from 0.0 on up, with a default of 1.0
  - *blurCenter*: The normalized center of the blur. (0.5, 0.5) by default

### Blending modes ###

- **GPUImageChromaKeyBlendFilter**: Selectively replaces a color in the first image with the second image
  - *thresholdSensitivity*: How close a color match needs to exist to the target color to be replaced (default of 0.4)
  - *smoothing*: How smoothly to blend for the color match (default of 0.1)

- **GPUImageDissolveBlendFilter**: Applies a dissolve blend of two images
  - *mix*: The degree with which the second image overrides the first (0.0 - 1.0, with 0.5 as the default)

- **GPUImageMultiplyBlendFilter**: Applies a multiply blend of two images

- **GPUImageAddBlendFilter**: Applies an additive blend of two images

- **GPUImageSubtractBlendFilter**: Applies a subtractive blend of two images

- **GPUImageDivideBlendFilter**: Applies a division blend of two images

- **GPUImageOverlayBlendFilter**: Applies an overlay blend of two images

- **GPUImageDarkenBlendFilter**: Blends two images by taking the minimum value of each color component between the images

- **GPUImageLightenBlendFilter**: Blends two images by taking the maximum value of each color component between the images

- **GPUImageColorBurnBlendFilter**: Applies a color burn blend of two images

- **GPUImageColorDodgeBlendFilter**: Applies a color dodge blend of two images

- **GPUImageScreenBlendFilter**: Applies a screen blend of two images

- **GPUImageExclusionBlendFilter**: Applies an exclusion blend of two images

- **GPUImageDifferenceBlendFilter**: Applies a difference blend of two images

- **GPUImageHardLightBlendFilter**: Applies a hard light blend of two images

- **GPUImageSoftLightBlendFilter**: Applies a soft light blend of two images

- **GPUImageAlphaBlendFilter**: Blends the second image over the first, based on the second's alpha channel
  - *mix*: The degree with which the second image overrides the first (0.0 - 1.0, with 1.0 as the default)

- **GPUImageSourceOverBlendFilter**: Applies a source over blend of two images

- **GPUImageColorBurnBlendFilter**: Applies a color burn blend of two images

- **GPUImageColorDodgeBlendFilter**: Applies a color dodge blend of two images

- **GPUImageNormalBlendFilter**: Applies a normal blend of two images

- **GPUImageColorBlendFilter**: Applies a color blend of two images

- **GPUImageHueBlendFilter**: Applies a hue blend of two images

- **GPUImageSaturationBlendFilter**: Applies a saturation blend of two images

- **GPUImageLuminosityBlendFilter**: Applies a luminosity blend of two images

- **GPUImageLinearBurnBlendFilter**: Applies a linear burn blend of two images

- **GPUImagePoissonBlendFilter**: Applies a Poisson blend of two images
  - *mix*: Mix ranges from 0.0 (only image 1) to 1.0 (only image 2 gradients), with 1.0 as the normal level
  - *numIterations*: The number of times to propagate the gradients. Crank this up to 100 or even 1000 if you want to get anywhere near convergence.  Yes, this will be slow.

- **GPUImageMaskFilter**: Masks one image using another

### Visual effects ###

- **GPUImagePixellateFilter**: Applies a pixellation effect on an image or video
  - *fractionalWidthOfAPixel*: How large the pixels are, as a fraction of the width and height of the image (0.0 - 1.0, default 0.05)

- **GPUImagePolarPixellateFilter**: Applies a pixellation effect on an image or video, based on polar coordinates instead of Cartesian ones
  - *center*: The center about which to apply the pixellation, defaulting to (0.5, 0.5)
  - *pixelSize*: The fractional pixel size, split into width and height components. The default is (0.05, 0.05)

- **GPUImagePolkaDotFilter**: Breaks an image up into colored dots within a regular grid
  - *fractionalWidthOfAPixel*: How large the dots are, as a fraction of the width and height of the image (0.0 - 1.0, default 0.05)
  - *dotScaling*: What fraction of each grid space is taken up by a dot, from 0.0 to 1.0 with a default of 0.9.

- **GPUImageHalftoneFilter**: Applies a halftone effect to an image, like news print
  - *fractionalWidthOfAPixel*: How large the halftone dots are, as a fraction of the width and height of the image (0.0 - 1.0, default 0.05)

- **GPUImageCrosshatchFilter**: This converts an image into a black-and-white crosshatch pattern
  - *crossHatchSpacing*: The fractional width of the image to use as the spacing for the crosshatch. The default is 0.03.
  - *lineWidth*: A relative width for the crosshatch lines. The default is 0.003.

- **GPUImageSketchFilter**: Converts video to look like a sketch. This is just the Sobel edge detection filter with the colors inverted
  - *texelWidth*: 
  - *texelHeight*: These parameters affect the visibility of the detected edges
  - *edgeStrength*: Adjusts the dynamic range of the filter. Higher values lead to stronger edges, but can saturate the intensity colorspace. Default is 1.0.

- **GPUImageThresholdSketchFilter**: Same as the sketch filter, only the edges are thresholded instead of being grayscale
  - *texelWidth*: 
  - *texelHeight*: These parameters affect the visibility of the detected edges
  - *edgeStrength*: Adjusts the dynamic range of the filter. Higher values lead to stronger edges, but can saturate the intensity colorspace. Default is 1.0.
  - *threshold*: Any edge above this threshold will be black, and anything below white. Ranges from 0.0 to 1.0, with 0.8 as the default

- **GPUImageToonFilter**: This uses Sobel edge detection to place a black border around objects, and then it quantizes the colors present in the image to give a cartoon-like quality to the image.
  - *texelWidth*: 
  - *texelHeight*: These parameters affect the visibility of the detected edges
  - *threshold*: The sensitivity of the edge detection, with lower values being more sensitive. Ranges from 0.0 to 1.0, with 0.2 as the default
  - *quantizationLevels*: The number of color levels to represent in the final image. Default is 10.0

- **GPUImageSmoothToonFilter**: This uses a similar process as the GPUImageToonFilter, only it precedes the toon effect with a Gaussian blur to smooth out noise.
  - *texelWidth*: 
  - *texelHeight*: These parameters affect the visibility of the detected edges
  - *blurRadiusInPixels*: The radius of the underlying Gaussian blur. The default is 2.0.
  - *threshold*: The sensitivity of the edge detection, with lower values being more sensitive. Ranges from 0.0 to 1.0, with 0.2 as the default
  - *quantizationLevels*: The number of color levels to represent in the final image. Default is 10.0

- **GPUImageEmbossFilter**: Applies an embossing effect on the image
  - *intensity*: The strength of the embossing, from  0.0 to 4.0, with 1.0 as the normal level

- **GPUImagePosterizeFilter**: This reduces the color dynamic range into the number of steps specified, leading to a cartoon-like simple shading of the image.
  - *colorLevels*: The number of color levels to reduce the image space to. This ranges from 1 to 256, with a default of 10.

- **GPUImageSwirlFilter**: Creates a swirl distortion on the image
  - *radius*: The radius from the center to apply the distortion, with a default of 0.5
  - *center*: The center of the image (in normalized coordinates from 0 - 1.0) about which to twist, with a default of (0.5, 0.5)
  - *angle*: The amount of twist to apply to the image, with a default of 1.0

- **GPUImageBulgeDistortionFilter**: Creates a bulge distortion on the image
  - *radius*: The radius from the center to apply the distortion, with a default of 0.25
  - *center*: The center of the image (in normalized coordinates from 0 - 1.0) about which to distort, with a default of (0.5, 0.5)
  - *scale*: The amount of distortion to apply, from -1.0 to 1.0, with a default of 0.5

- **GPUImagePinchDistortionFilter**: Creates a pinch distortion of the image
  - *radius*: The radius from the center to apply the distortion, with a default of 1.0
  - *center*: The center of the image (in normalized coordinates from 0 - 1.0) about which to distort, with a default of (0.5, 0.5)
  - *scale*: The amount of distortion to apply, from -2.0 to 2.0, with a default of 1.0

- **GPUImageStretchDistortionFilter**: Creates a stretch distortion of the image
  - *center*: The center of the image (in normalized coordinates from 0 - 1.0) about which to distort, with a default of (0.5, 0.5)

- **GPUImageSphereRefractionFilter**: Simulates the refraction through a glass sphere
  - *center*: The center about which to apply the distortion, with a default of (0.5, 0.5)
  - *radius*: The radius of the distortion, ranging from 0.0 to 1.0, with a default of 0.25
  - *refractiveIndex*: The index of refraction for the sphere, with a default of 0.71

- **GPUImageGlassSphereFilter**: Same as the GPUImageSphereRefractionFilter, only the image is not inverted and there's a little bit of frosting at the edges of the glass
  - *center*: The center about which to apply the distortion, with a default of (0.5, 0.5)
  - *radius*: The radius of the distortion, ranging from 0.0 to 1.0, with a default of 0.25
  - *refractiveIndex*: The index of refraction for the sphere, with a default of 0.71

- **GPUImageVignetteFilter**: Performs a vignetting effect, fading out the image at the edges
  - *vignetteCenter*: The center for the vignette in tex coords (CGPoint), with a default of 0.5, 0.5
  - *vignetteColor*: The color to use for the vignette (GPUVector3), with a default of black
  - *vignetteStart*: The normalized distance from the center where the vignette effect starts, with a default of 0.5
  - *vignetteEnd*: The normalized distance from the center where the vignette effect ends, with a default of 0.75

- **GPUImageKuwaharaFilter**: Kuwahara image abstraction, drawn from the work of Kyprianidis, et. al. in their publication "Anisotropic Kuwahara Filtering on the GPU" within the GPU Pro collection. This produces an oil-painting-like image, but it is extremely computationally expensive, so it can take seconds to render a frame on an iPad 2. This might be best used for still images.
  - *radius*: In integer specifying the number of pixels out from the center pixel to test when applying the filter, with a default of 4. A higher value creates a more abstracted image, but at the cost of much greater processing time.

- **GPUImageKuwaharaRadius3Filter**: A modified version of the Kuwahara filter, optimized to work over just a radius of three pixels

- **GPUImagePerlinNoiseFilter**: Generates an image full of Perlin noise
  - *colorStart*:
  - *colorFinish*: The color range for the noise being generated
  - *scale*: The scaling of the noise being generated

- **GPUImageCGAColorspaceFilter**: Simulates the colorspace of a CGA monitor

- **GPUImageMosaicFilter**: This filter takes an input tileset, the tiles must ascend in luminance. It looks at the input image and replaces each display tile with an input tile according to the luminance of that tile.  The idea was to replicate the ASCII video filters seen in other apps, but the tileset can be anything.
  - *inputTileSize*:
  - *numTiles*: 
  - *displayTileSize*:
  - *colorOn*:

- **GPUImageJFAVoronoiFilter**: Generates a Voronoi map, for use in a later stage.
  - *sizeInPixels*: Size of the individual elements

- **GPUImageVoronoiConsumerFilter**: Takes in the Voronoi map, and uses that to filter an incoming image.
  - *sizeInPixels*: Size of the individual elements

You can also easily write your own custom filters using the C-like OpenGL Shading Language, as described above.

## Sample applications ##

Several sample applications are bundled with the framework source. Most are compatible with both iPhone and iPad-class devices. They attempt to show off various aspects of the framework and should be used as the best examples of the API while the framework is under development. These include:

### SimpleImageFilter ###

A bundled JPEG image is loaded into the application at launch, a filter is applied to it, and the result rendered to the screen. Additionally, this sample shows two ways of taking in an image, filtering it, and saving it to disk.

### SimpleVideoFilter ###

A pixellate filter is applied to a live video stream, with a UISlider control that lets you adjust the pixel size on the live video.

### SimpleVideoFileFilter ###

A movie file is loaded from disk, an unsharp mask filter is applied to it, and the filtered result is re-encoded as another movie.

### MultiViewFilterExample ###

From a single camera feed, four views are populated with realtime filters applied to camera. One is just the straight camera video, one is a preprogrammed sepia tone, and two are custom filters based on shader programs.

### FilterShowcase ###

This demonstrates every filter supplied with GPUImage.

### BenchmarkSuite ###

This is used to test the performance of the overall framework by testing it against CPU-bound routines and Core Image. Benchmarks involving still images and video are run against all three, with results displayed in-application.

### CubeExample ###

This demonstrates the ability of GPUImage to interact with OpenGL ES rendering. Frames are captured from the camera, a sepia filter applied to them, and then they are fed into a texture to be applied to the face of a cube you can rotate with your finger. This cube in turn is rendered to a texture-backed framebuffer object, and that texture is fed back into GPUImage to have a pixellation filter applied to it before rendering to screen.

In other words, the path of this application is camera -> sepia tone filter -> cube -> pixellation filter -> display.

### ColorObjectTracking ###

A version of my ColorTracking example from http://www.sunsetlakesoftware.com/2010/10/22/gpu-accelerated-video-processing-mac-and-ios ported across to use GPUImage, this application uses color in a scene to track objects from a live camera feed. The four views you can switch between include the raw camera feed, the camera feed with pixels matching the color threshold in white, the processed video where positions are encoded as colors within the pixels passing the threshold test, and finally the live video feed with a dot that tracks the selected color. Tapping the screen changes the color to track to match the color of the pixels under your finger. Tapping and dragging on the screen makes the color threshold more or less forgiving. This is most obvious on the second, color thresholding view.

Currently, all processing for the color averaging in the last step is done on the CPU, so this is part is extremely slow.

### 小知识

1. 控制器sink型输出是什么意思
  - SOURCE和 SINK说的是输入类型。
  - 从端口向外电路流出电流称为拉电流（SOURCE CURRENT）；
  - 从外电路流入端口的电流称为灌电流（SINK CURRENT）；
  - 即 电流流向输入接口的SINK型输入，电流流出输入接口的叫SOURCE型输入。
  - 所以一般将filters，分为：source, transform, sink; 插件式滤波器架构，常用于数据流处理

2. 
