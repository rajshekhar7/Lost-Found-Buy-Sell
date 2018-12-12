<?php  include('../config.php'); ?>
	<?php include(ROOT_PATH . '/admin/includes/admin_functions.php'); ?>
	<?php include(ROOT_PATH . '/admin/includes/head_section.php'); ?>
	<title>Admin | Dashboard</title>
</head>
<body>
	<div class="header">
		<div class="logo">
			<a href="<?php echo BASE_URL .'admin/index.php' ?>">
				<h1>Blog - Admin</h1>
			</a>
		</div>
		<?php if (isset($_SESSION['user'])): ?>
			<div class="user-info">
				<span><?php echo strtoupper($_SESSION['user']['username']) ?></span> &nbsp; &nbsp;
				<a href="<?php echo BASE_URL . '/logout.php'; ?>" class="logout-btn">Log Out</a>
			</div>
		<?php endif ?>
	</div>
	<div class="container dashboard" style="text-align:center">
		<h1>Welcome</h1>
		<div class="stats">
			<a href="posts.php">
				<span>Manage Post</span> <br>
			</a>
			<!-- <a href="posts.php">
				<span>Check</span> <br>
				<span>Published comments</span>
			</a> -->
			<a href="post.php">
				<span>Add Post</span> <br>
			</a>
		</div>
	</div>
</body>
</html>
