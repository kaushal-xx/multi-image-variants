// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).ready(function() {
	var $videoTrigger = $('#videoTrigger'),
		$videoInfo = $('#videoInfo'),
		$videoPlayer = $('#videoPlayer'),
		$closeVideo = $('#closeVideo'),
		$masterSwitch = $('#masterSwitch'),
		$masterEnable = $('#ms-en'),
		$masterDisable = $('#ms-di');

	function setMasterSwitchValue() {
		if($masterSwitch.is(":checked")) {
			$masterEnable.css('color', '#48AFF1');
			$masterDisable.css('color', '#333');
		} else {
			$masterDisable.css('color', '#48AFF1');
			$masterEnable.css('color', '#333');
		}
	};

	function init() {
		$masterSwitch.prop('checked', true);
		setMasterSwitchValue();
		$videoPlayer.hide();
	};

	function playVideo() {
		$videoPlayer.show();
		$videoTrigger.hide();

		$videoInfo.removeClass('col-sm-8');
		$videoInfo.addClass('col-sm-12');

		$(videoPlayer).find('iframe').attr('src', 'https://www.youtube.com/embed/iNjgZJRBuME?autoplay=1');
	};

	function closeVideo() {
		$videoPlayer.hide();
		$videoTrigger.show();

		$videoInfo.removeClass('col-sm-12');
		$videoInfo.addClass('col-sm-8');

		$(videoPlayer).find('iframe').attr('src', '');
	};

	function setMasterSwitch() {
		setMasterSwitchValue();
	};

	$videoTrigger.on('click', playVideo);
	$closeVideo.on('click', closeVideo);
	$masterSwitch.on('click', setMasterSwitch);

	init();
    this.App || (this.App = {});

    App.cable = ActionCable.createConsumer();
})


