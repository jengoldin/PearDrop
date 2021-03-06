"use strict";

(function ($) {
	// validation
	var input = $(".validate-input .input100");

	$(".validate-form").submit(function () {
		var check = true;

		for (var inp of input) {
			if (!validate(inp)) {
				showValidate(inp);
				check = false;
			}
		}

		return check;
	});

	$(".validate-form .input100").each(function () {
		$(this).focus(function () {
			hideValidate(this);
		});
	});

	function validate(input) {
		if ($(input).attr("type") == "email" || $(input).attr("name") == "email") {
			if (
				$(input)
					.val()
					.trim()
					.match(
						/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/
					) === null
			) {
				return false;
			}
		} else {
			if ($(input).val().trim().length === 0) {
				return false;
			}
		}
	}

	function showValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).addClass("alert-validate");
	}

	function hideValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).removeClass("alert-validate");
	}
	//  modal
	$(".modal-subscribe").click(function (e) {
		e.stopPropagation();
	});

	$(".btn-close-modal").click(function () {
		$("#subscribe").modal("hide");
	});

	// tilt
	$(".js-tilt").tilt({
		scale: 1.1
	});

	// send mail
	$(submit).click(function() {
		window.location.href =
			"mailto:gspam275@gmail.com?subject=" +
			encodeURI(
				document.getElementById("name_field").value +
					": New PearDrop Subscriber Email"
			) +
			"&body=" +
			encodeURI(document.getElementById("email_field").value);
		return false;
	});

	// countdown
	var deadline = new Date("Jun 28, 2020 15:37:25").getTime();
	var x = setInterval(function () {
		var now = new Date().getTime();
		var t = deadline - now;
		if (t < 0) {
			t = 0;
		}
		document.getElementById("days").innerHTML = Math.floor(
			t / (1000 * 60 * 60 * 24)
		);
		document.getElementById("hours").innerHTML = Math.floor(
			(t % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
		);
		document.getElementById("minutes").innerHTML = Math.floor(
			(t % (1000 * 60 * 60)) / (1000 * 60)
		);
		document.getElementById("seconds").innerHTML = Math.floor(
			(t % (1000 * 60)) / 1000
		);
	}, 1000);
})(jQuery);
