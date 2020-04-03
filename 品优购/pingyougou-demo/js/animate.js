function animate(obj, target, callback) {
    clearInterval(obj.timer)
    obj.timer = setInterval(function() {
        var steps = (target - obj.offsetLeft) / 10
        steps = steps < 0 ? Math.floor(steps) : Math.ceil(steps)
        if (obj.offsetLeft == target) {
            clearInterval(obj.timer)
            callback && callback()
            return
        }
        obj.style.left = obj.offsetLeft + steps + 'px'
    }, 15)
}