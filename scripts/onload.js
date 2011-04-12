//-------------------------------------------------------------------
// apply some gradients
//-------------------------------------------------------------------
function ghb_onload() {
    var purple = "AF3FFF"
    var gray   = "DFDFDF"
    
//    $('.gradient_right'  ).gradient({ from: purple, to: gray,   direction: 'vertical' })
//    $('.gradient_top'    ).gradient({ from: purple, to: gray,   direction: 'horizontal' })
//    $('.gradient_bottom' ).gradient({ from: gray,   to: purple, direction: 'horizontal' })
    
//    $('h2, h3, h4, h5').corner()
    
//    $('.shadow').shadow()

    $('.iea').each(function(index) {
        var email = this.innerHTML
        
        var pattern_at  = /\s+at\s+/
        var pattern_dot = /\s+dot\s+/
        
        email = email.split(pattern_at).join("@")
        email = email.split(pattern_dot).join(".")
        this.innerHTML = "<a href='mailto:" + email + "'>" + email + "</a>"
    })
}