# 前端学习(三)CSS的使用

#### 1.CSS是如何工作的

​	1.浏览器加载HTML(从网络上下载，或从本地读取)。

​	2.将HTML转化为DOM。

​	3.浏览器抓取HTML上的资源文件，如图片和视频，以及CSS。

​	4.浏览器解析CSS,并根据选择器类型将它们分入不同的bucket中，例如根据元素，class，ID等。根据找到的选择器，得出DOM中的节点应该使用哪种rule，并且获取节点需要的style。

​	5.渲染树在获取到rule之后，根据结构来布局。

​	6.要显示的页面出现在屏幕上。

#### 2.DOM的创建

```html
<p>
  Let's use:
  <span>Cascading</span>
  <span>Style</span>
  <span>Sheets</span>
</p>
```



上面的这个html文件，生成了下面的DOM Tree

```html
P
├─ "Let's use:"
├─ SPAN
|  └─ "Cascading"
├─ SPAN
|  └─ "Style"
└─ SPAN
   └─ "Sheets"
```



#### 3.CSS的使用位置

-  external：在单独的css文件中，是最主流的显示方式。

-  internal：在html的head标签里，通过style标签来使用

-  inline：在具体的标签里使用，这种使用是应该尽量避免的

####4.CSS Selector

选择器用于选择你想要的元素的样式的模式，包括以下几种：

- type-selector: 指定类型，如h1 {}
- class-selector:指定class, 如.box {}
- id-selector: 指定id, 如#unique {}
- attribute selector: 指定具体的属性，如a[title] {}

####5.CSS的优先级-Specificity

如果一个标签可能会使用多个选择器，那么相同的属性之间选用哪个value，取决于选择器的优先级

如type-selector和class-selector，那么class-selector优先级高

```css
<h1 class="box"></h1>
h1 {
	color: blue;
}
.box {
	color: red;
}
```

如上图，实际显示颜色应该为优先级更高的.box选择器中的红色

####6.CSS的一些特性：

- @rules：关键字，如引入@import。如@media可针对不同类型或屏幕尺寸设置不同的样式
- Shorthands：在一行以内可设置多个属性，如Padding.    `padding:10px,10px,20px,20px`
- comments：注释
- whte-space： 空格和回车的合理使用，可使样式文件更易读

#### 5.VSCode的使用

教程-[这里](https://code.makery.ch/library/html-css/part1/)。