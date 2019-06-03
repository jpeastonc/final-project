var beginingTime = new Date().getTime();

var timer = setInterval(function() {

    let now = new Date().getTime();
    let t = now - beginingTime;
    
    if (t >= 0) {
        let hours = Math.floor((t % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        let mins = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
        let secs = Math.floor((t % (1000 * 60)) / 1000);
    
        document.getElementById("timer-mins").innerHTML = ("0"+mins).slice(-2) +
        "<span class='time_label'>mins</span>";
    
        document.getElementById("timer-secs").innerHTML = ("0"+secs).slice(-2) +
        "<span class='time_label'>secs</span>";
    
    } else {

        document.getElementById("timer").innerHTML = "Error";
    
    }
    
}, 1000);