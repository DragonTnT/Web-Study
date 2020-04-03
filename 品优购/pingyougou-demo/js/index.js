window.addEventListener('load', function() {

    var dataSouce = ['upload/focus.jpg', 'upload/pic1.jpg', 'upload/floor-1-1.png', 'upload/focus.jpg']
    var pageIndex = 0
        //节流阀，阻止因左右按钮多次点击导致的图片切换太快
    var animatingFlag = false

    var focus = document.querySelector('.focus')
    var arrowL = focus.querySelector('.arrow-l')
    var arrowR = focus.querySelector('.arrow-r')
    var imgBox = focus.querySelector('.img-box')

    //根据数据源设置imgBox的宽度
    var scrollWidth = focus.offsetWidth
    imgBox.style.width = dataSouce.length * scrollWidth + 'px'

    focus.addEventListener('mouseover', function() {
        arrowL.style.display = 'inline'
        arrowR.style.display = 'inline'
    })

    focus.addEventListener('mouseout', function() {
        arrowL.style.display = 'none'
        arrowR.style.display = 'none'
    })

    //为左右箭头添加点击事件
    arrowL.addEventListener('click', function() {
        if (animatingFlag) { return }
        if (pageIndex == 0) {
            imgBox.style.left = -(dataSouce.length - 1) * scrollWidth + 'px'
            pageIndex = dataSouce.length - 1
        }
        pageIndex--
        imageScrollTo(pageIndex)
    })

    arrowR.addEventListener('click', function() {
        if (animatingFlag) { return }
        if (pageIndex == dataSouce.length - 1) {
            imgBox.style.left = 0
            pageIndex = 0
        }
        pageIndex++
        imageScrollTo(pageIndex)
    })

    //添加轮播图
    addChildImgOn()

    //为轮播图添加定时器
    var timer = setInterval(function() {
        arrowR.click()
    }, 2000)

    //为轮播图添加mouseover和mouseout事件
    focus.addEventListener('mouseover', function() {
        clearInterval(timer)
        timer = null
    })
    focus.addEventListener('mouseout', function() {
        timer = setInterval(function() {
            arrowR.click()
        }, 2000)
    })

    //添加底部选择按钮
    var circles = focus.querySelector('.circles')
    addChildCircleOn()


    //创建轮播图中的li
    function addChildImgOn() {
        for (i = 0; i < dataSouce.length; i++) {
            var li = document.createElement('li')
            var img = document.createElement('img')
            img.src = dataSouce[i]
            li.appendChild(img)
            imgBox.appendChild(li)
        }
    }

    //创建底部小圆圈
    function addChildCircleOn() {
        for (i = 0; i < dataSouce.length - 1; i++) {
            var li = document.createElement('li')
            li.pageIndex = i
            if (i == 0) {
                li.setAttribute('class', 'current')
            }
            li.addEventListener('click', function() {
                if (animatingFlag) { return }
                imageScrollTo(this.pageIndex)
                pageIndex = this.pageIndex
            })
            circles.appendChild(li)
        }
    }



    //轮播图滑动至index
    function imageScrollTo(index) {
        animatingFlag = true
        animate(imgBox, -index * scrollWidth, function() {
            animatingFlag = false
        })

        var circleIndex = index % (dataSouce.length - 1)
        setChildCircleAt(circleIndex)
    }

    //底部圆圈选中index
    function setChildCircleAt(index) {
        for (i = 0; i < circles.children.length; i++) {
            if (i == index) {
                circles.children[i].className = 'current'
            } else {
                circles.children[i].className = ''
            }
        }
    }

})