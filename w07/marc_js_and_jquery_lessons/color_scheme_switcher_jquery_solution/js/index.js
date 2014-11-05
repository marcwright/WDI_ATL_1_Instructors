// when you click the gray button, change the background color to gray

console.log('hello');

function useGrayTheme() {
    // document.body.style.backgroundColor = 'gray';
    // document.body.style.margin = '40px';
    // alert('Hi, there.');
    $('body').css('backgroundColor', 'gray');
}

function useWhiteTheme() {
    // document.body.style.backgroundColor = 'white';
    $('body').css('backgroundColor', 'white');
}


// document.getElementById('grayButton').onclick = useGrayTheme;
$('#grayButton').click(useGrayTheme);

// document.getElementById('whiteButton').onclick = useWhiteTheme;
$('#whiteButton').click(useWhiteTheme);

// document.getElementById('grayButton').onclick = switchGray;
// document.getElementById('whiteButton').onclick = switchWhite;

// function switchGray() {
//   document.body.style.backgroundColor = 'gray';
//  document.body.style.color = 'white';
// }

// function switchWhite() {
//   document.body.style.backgroundColor = 'white';
//   document.body.style.color = 'black';
// }