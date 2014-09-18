function romanize(num){
    var string = '';
    var values = [1000,900,500,400,100,90,50,40,10,9,5,4,1];
    var romanNumerals = ['M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I'];
    for(var i = 0; i < 13; i++) {
        var value = values[i];
        while(num >= value){
            num -= value;
            string += romanNumerals[i];
        }
        if(num === 0) return string;
    }
}
