<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	function pagination() {
		var req_num_row = 3;
		var $tr = jQuery('tbody tr');
		var total_num_row = $tr.length;
		var num_pages = 0;
		if (total_num_row % req_num_row == 0) {
			num_pages = total_num_row / req_num_row;
		}
		if (total_num_row % req_num_row >= 1) {
			num_pages = total_num_row / req_num_row;
			num_pages++;
			num_pages = Math.floor(num_pages++);
		}

		jQuery('.pagination').append("<li><a class=\"prev\">Previous</a></li>");

		for (var i = 1; i <= num_pages; i++) {
			jQuery('.pagination').append("<li><a>" + i + "</a></li>");
			jQuery('.pagination li:nth-child(2)').addClass("active");
			jQuery('.pagination a').addClass("pagination-link");
		}

		jQuery('.pagination').append("<li><a class=\"next\">Next</a></li>");

		$tr.each(function(i) {
			jQuery(this).hide();
			if (i + 1 <= req_num_row) {
				$tr.eq(i).show();
			}
		});

		jQuery('.pagination a').click('.pagination-link', function(e) {
			e.preventDefault();
			$tr.hide();
			var page = jQuery(this).text();
			var temp = page - 1;
			var start = temp * req_num_row;
			var current_link = temp;

			jQuery('.pagination li').removeClass("active");
			jQuery(this).parent().addClass("active");

			for (var i = 0; i < req_num_row; i++) {
				$tr.eq(start + i).show();
			}

			if (temp >= 1) {
				jQuery('.pagination li:first-child').removeClass("disabled");
			} else {
				jQuery('.pagination li:first-child').addClass("disabled");
			}

		});

		jQuery('.prev').click(function(e) {
			e.preventDefault();
			jQuery('.pagination li:first-child').removeClass("active");
		});

		jQuery('.next').click(function(e) {
			e.preventDefault();
			jQuery('.pagination li:last-child').removeClass("active");
		});

	}

	jQuery('document').ready(function() {
		pagination();

		jQuery('.pagination li:first-child').addClass("disabled");

	});
</script>

</head>
<body>
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Page</th>
					<th>Visits</th>
					<th>% New Visits</th>
					<th>Revenue</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>/index.html</td>
					<td>1265</td>
					<td>32.3%</td>
					<td>$321.33</td>
				</tr>
				<tr>
					<td>/about.html</td>
					<td>261</td>
					<td>33.3%</td>
					<td>$234.12</td>
				</tr>
				<tr>
					<td>/sales.html</td>
					<td>665</td>
					<td>21.3%</td>
					<td>$16.34</td>
				</tr>
				<tr>
					<td>/blog.html</td>
					<td>9516</td>
					<td>89.3%</td>
					<td>$1644.43</td>
				</tr>
				<tr>
					<td>/404.html</td>
					<td>23</td>
					<td>34.3%</td>
					<td>$23.52</td>
				</tr>
				<tr>
					<td>/services.html</td>
					<td>421</td>
					<td>60.3%</td>
					<td>$724.32</td>
				</tr>
				<tr>
					<td>/blog/post.html</td>
					<td>1233</td>
					<td>93.2%</td>
					<td>$126.34</td>
				</tr>
				<tr>
					<td>/index.html</td>
					<td>1265</td>
					<td>32.3%</td>
					<td>$321.33</td>
				</tr>
				<tr>
					<td>/about.html</td>
					<td>261</td>
					<td>33.3%</td>
					<td>$234.12</td>
				</tr>
				<tr>
					<td>/sales.html</td>
					<td>665</td>
					<td>21.3%</td>
					<td>$16.34</td>
				</tr>
				<tr>
					<td>/blog.html</td>
					<td>9516</td>
					<td>89.3%</td>
					<td>$1644.43</td>
				</tr>
				<tr>
					<td>/404.html</td>
					<td>23</td>
					<td>34.3%</td>
					<td>$23.52</td>
				</tr>
				<tr>
					<td>/services.html</td>
					<td>421</td>
					<td>60.3%</td>
					<td>$724.32</td>
				</tr>
				<tr>
					<td>/blog/post.html</td>
					<td>1233</td>
					<td>93.2%</td>
					<td>$126.34</td>
				</tr>
				<tr>
					<td>/index.html</td>
					<td>1265</td>
					<td>32.3%</td>
					<td>$321.33</td>
				</tr>
				<tr>
					<td>/about.html</td>
					<td>261</td>
					<td>33.3%</td>
					<td>$234.12</td>
				</tr>
				<tr>
					<td>/sales.html</td>
					<td>665</td>
					<td>21.3%</td>
					<td>$16.34</td>
				</tr>
				<tr>
					<td>/blog.html</td>
					<td>9516</td>
					<td>89.3%</td>
					<td>$1644.43</td>
				</tr>
				<tr>
					<td>/404.html</td>
					<td>23</td>
					<td>34.3%</td>
					<td>$23.52</td>
				</tr>
				<tr>
					<td>/services.html</td>
					<td>421</td>
					<td>60.3%</td>
					<td>$724.32</td>
				</tr>
				<tr>
					<td>/blog/post.html</td>
					<td>1233</td>
					<td>93.2%</td>
					<td>$126.34</td>
				</tr>
				<tr>
					<td>/index.html</td>
					<td>1265</td>
					<td>32.3%</td>
					<td>$321.33</td>
				</tr>
				<tr>
					<td>/about.html</td>
					<td>261</td>
					<td>33.3%</td>
					<td>$234.12</td>
				</tr>
				<tr>
					<td>/sales.html</td>
					<td>665</td>
					<td>21.3%</td>
					<td>$16.34</td>
				</tr>
				<tr>
					<td>/blog.html</td>
					<td>9516</td>
					<td>89.3%</td>
					<td>$1644.43</td>
				</tr>

				<tr>
					<td>/404.html</td>
					<td>23</td>
					<td>34.3%</td>
					<td>$23.52</td>
				</tr>
				<tr>
					<td>/services.html</td>
					<td>421</td>
					<td>60.3%</td>
					<td>$724.32</td>
				</tr>
				<tr>
					<td>/blog/post.html</td>
					<td>1233</td>
					<td>93.2%</td>
					<td>$126.34</td>
				</tr>

			</tbody>
		</table>
		<ul class="pagination">

		</ul>
	</div>


</body>
</html>