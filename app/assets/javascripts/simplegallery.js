/****************************************************************************************
           Script to convert a bullet list of gallery images into a slideshow
                   Written by Mark Wilton-Jones, 23/08/2008-31/01/2009
                                       Version 1.0
*****************************************************************************************

Please see http://www.howtocreate.co.uk/jslibs/ for details and a demo of this script
Please see http://www.howtocreate.co.uk/tutorials/jsexamples/simpleslideshow.html for detailed instructions
Please see http://www.howtocreate.co.uk/jslibs/termsOfUse.html for terms of use
_____________________________________________________________________________________________________*/

(function () {

function showGalleryImage(oIndex) {
	//show an image and update the current index
	for( var i = this.imLIs.length - 1; i >= 0; i-- ) {
		this.imLIs[i].style.display = ( i == oIndex ) ? '' : 'none';
		this.LIs[i+1].className = ( i == oIndex ) ? 'activeimage' : '';
	}
	this.currentImage = oIndex;
}

function changeGalleryImageBy(oStep) {
	//rotate the index
	this.currentImage += oStep;
	if( this.currentImage >= this.imLIs.length ) {
		this.currentImage = 0;
	}
	if( this.currentImage < 0 ) {
		this.currentImage = this.imLIs.length - 1;
	}
	this.showGalleryImage(this.currentImage);
}

function prepareGalleries() {
	if( preparedGalleries ) { return; }
	preparedGalleries = true;
	if( !document.getElementById || !document.getElementsByTagName || !document.createElement || !document.childNodes ) { return; }
	var allULs = document.getElementsByTagName('ul');
	for( var i = allULs.length - 1; i >= 0; i-- ) {
		if( allULs[i].className.match(/(^| )galleryimages($| )/) ) {
			turnIntoGallery(allULs[i],allULs[i].getElementsByTagName('li'));
		}
	}
}

function createLI(parul,vistext,doclick,liindex) {
	var li, a;
	parul.appendChild(li = document.createElement('li'));
	li.appendChild(a = document.createElement('a'));
	a.liindex = liindex;
	a.href = 'javascript:void(0);';
	a.onclick = doclick;
	a.appendChild(document.createTextNode(vistext));
	if( vistext != '>>' ) {
		//leave a space so it wraps if there are too many - Opera leaves the padding on the previous line - weird ;)
		parul.appendChild(document.createTextNode(' '));
	} else if( window.opera ) {
		//hack to stop it pointlessly triggering Opera's Fast Forward
		a.insertBefore(document.createElement('span'),a.firstChild.splitText(1)).appendChild(document.createTextNode('='));
		a.childNodes[1].style.display = 'none';
	}
}

function turnIntoGallery(oUL,oLIs) {
	if( !oLIs.length ) { return; }
	//precache all images - most browsers will do this anyway, but those that don't (due to display:none) will make a jumpy effect without this
	var imgs = oUL.getElementsByTagName('img'), imlist;
	for( var i = 0; i < imgs.length; i++ ) {
		galleryCache[i] = new Image();
		galleryCache[i].src = imgs[i].src;
	}
	//prepare the list of image links
	oUL.parentNode.insertBefore(imlist = document.createElement('ul'),oUL);
	imlist.className = 'galleryimagelist';
	imlist.currentImage = 0;
	imlist.showGalleryImage = showGalleryImage;
	imlist.changeGalleryImageBy = changeGalleryImageBy;
	imlist.imLIs = oLIs;
	if( window.opera ) {
		//stop Opera's text selection and hotclick menu from appearing when flicking through images
		imlist.onmousedown = function () { return false; };
	}
	//create prev link
	createLI(imlist,'<<',function () { this.parentNode.parentNode.changeGalleryImageBy(-1); return false; });
	imlist.appendChild(document.createTextNode(' ')); //leave a space so it wraps
	for( var j = 0; j < oLIs.length; j++ ) {
		//create individual image links
		createLI(imlist,j+1,function () { this.parentNode.parentNode.showGalleryImage(this.liindex); return false; },j);
	}
	//create next link
	createLI(imlist,'>>',function () { this.parentNode.parentNode.changeGalleryImageBy(1); return false; });
	imlist.LIs = imlist.getElementsByTagName('li');
	imlist.showGalleryImage(0);
}

var galleryCache = [], preparedGalleries = false;

if( window.addEventListener ) {
	window.addEventListener('DOMContentLoaded',prepareGalleries,false);
	window.addEventListener('load',prepareGalleries,false);
} else if( document.addEventListener ) {
	document.addEventListener('DOMContentLoaded',prepareGalleries,false);
	document.addEventListener('load',prepareGalleries,false);
} else if( window.attachEvent ) {
	//IE has no true equivalent to DOMContentLoaded - readyState often skips 'interactive' or fires far too early
	window.attachEvent('onload',prepareGalleries);
}

})();