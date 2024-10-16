<?php $__env->startSection('seo_title'); ?> <?php echo app('translator')->get('navigation.editPost'); ?> - <?php $__env->stopSection(); ?>

<?php $__env->startSection( 'content' ); ?>
<div class="white-smoke-bg pt-4 pb-3">
<div class="container add-padding">
<div class="row">

<?php echo $__env->make('posts.sidebar-mobile', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

<div class="col-12 col-md-8">

<form id="updatePostFrm" name="updatePostFrm" method="POST" enctype="multipart/form-data" action="<?php echo e(route('updatePost', ['post' => $post])); ?>">
<?php echo csrf_field(); ?>

<div class="card mb-4 p-4">
<div class="row">

	<div class="col-sm-2 d-md-block d-none d-sm-none">
		<div class="profilePicSmall mt-0 ml-0 mr-2 mb-2 ml-md-3 profilePicOnlineSm shadow">
			<img src="<?php echo e($profile->profilePicture); ?>" alt="" width="75" height="75">
		</div>
	</div>
	<div class="col-12 col-sm-10" id="belowCreatePost">
		<textarea name="text_content" id="createPost" rows="1" class="form-control" placeholder="<?php echo app('translator')->get('post.writeSomething'); ?>" required="required"><?php echo e($post->text_content); ?></textarea>

		<br>
		  <input type="hidden" class="postType" name="lock_type" value="<?php echo e($post->lock_type); ?>">

		  <div class="row">
		   	<div class="col-12 col-sm-12 col-md-8">

				<a href="javascript:void(0);" class="mr-2 noHover text-danger imageUploadLink" data-toggle="tooltip" title="<?php echo app('translator')->get('post.imageUpload'); ?>">
					<h5 class="d-inline"><i class="fas fa-image"></i></h5>
				</a>

				<a href="javascript:void(0);" class="mr-2 noHover text-info videoUploadLink" data-toggle="tooltip" title="<?php echo app('translator')->get('post.videoUpload'); ?>">
					<h5 class="d-inline"><i class="fas fa-video"></i></h5>
				</a>

				<a href="javascript:void(0);" class="mr-2 noHover text-secondary audioUploadLink" data-toggle="tooltip" title="<?php echo app('translator')->get('post.audioUpload'); ?>">
					<h5 class="d-inline"><i class="fas fa-music"></i></h5>
				</a>

				<a href="javascript:void(0);" class="ml-1 mr-2 noHover text-dark zipUploadLink" data-toggle="tooltip" title="<?php echo app('translator')->get('v16.zipUpload'); ?>">
					<h5 class="d-inline"><i class="fas fa-file-archive"></i></h5>
				</a>

				<a href="javascript:void(0);" class="togglePostType noHover <?php if($post->lock_type == 'Paid'): ?> d-none <?php endif; ?>" data-switch-to="paid" data-toggle="tooltip" title="<?php echo app('translator')->get('post.freePost'); ?>">
					<h5 class="d-inline"><i class="fas fa-lock-open text-success"></i></h5>
				</a>

				<a href="javascript:void(0);" class="togglePostType noHover <?php if($post->lock_type == 'Free'): ?> d-none <?php endif; ?>" data-switch-to="free" data-toggle="tooltip" title="<?php echo app('translator')->get('post.paidPost'); ?>">
					<h5 class="d-inline"><i class="fas fa-lock text-warning"></i></h5>
				</a>

				<input type="file" name="imageUpload[]" accept="image/*" class="multipleImgUpload with-preview d-none">
				<input type="file" name="videoUpload" accept="video/mp4,video/webm,video/ogg,video/quicktime" class="d-none">
				<input type="file" name="audioUpload" accept="audio/mpeg" class="d-none">
				<input type="file" name="zipUpload" accept="zip,application/zip,application/x-zip,application/x-zip-compressed,.zip" class="d-none">
			</div>
			
			<div class="col-12 col-sm-12 col-md-4 text-right">
				<button type="submit" class="btn btn-primary btnUpdatePost mb-2 ml-2">
					<i class="far fa-paper-plane mr-1"></i> <?php echo app('translator')->get('post.updatePost'); ?>
				</button>
			</div>
		</div>

	</div>

	<div class="uploadName col-12"></div>

</div><!-- .row -->

</div><!-- ./card -->
</form>

<?php if($post->media_type != 'None'): ?>
<div class="card p-3">
<a class="btn btn-light remove-media col-3" href="<?php echo e(route('deleteMedia', ['post' => $post])); ?>">
	<i class="fas fa-backspace"></i> 
	<?php echo app('translator')->get('post.removeMedia'); ?>
</a>
<br>
<?php echo $__env->make('posts.post-media', ['post' => $post], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</div>
<?php endif; ?>

</div>

<?php echo $__env->make('posts.sidebar-desktop', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

</div><!-- paddin top 5-->
</div><!-- ./container -->
</div><!-- .swhite-smoke -->
<?php $__env->stopSection(); ?>

<?php $__env->startPush( 'extraJS' ); ?>

<script src="<?php echo e(asset('js/jquery.MultiFile.min.js')); ?>"></script>
<script>
$( function() {

	$(".zipUploadLink").click(function () {
		$("input[name=zipUpload]").trigger('click');
	});

	var createPostTextarea = document.getElementById('createPost');

	createPostTextarea.style.overflow = 'hidden';
	createPostTextarea.style.height = createPostTextarea.scrollHeight + 'px';

	// auto expand textarea
	document.getElementById('createPost').addEventListener('keyup', function() {
		this.style.overflow = 'hidden';
		this.style.height = 0;
		this.style.height = this.scrollHeight + 'px';
	}, false);

	$(".imageUploadLink").click(function () {
		$(".multipleImgUpload").trigger('click');
	});

	$('.multipleImgUpload').MultiFile({
		accept:'gif|jpg|png|jpeg', 
		max:10, 
		STRING: { 
			remove:'X', 
			selected:'$file', 
			denied:'Not allowed $ext!', 
			duplicate:'Already selected:\n$file!'
		}
	});

});
</script>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('extraCSS'); ?>
<style>
.MultiFile-remove, .MultiFile-title {
	display: none;
}
</style>
<?php $__env->stopPush(); ?>
<?php echo $__env->make( 'welcome' , \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/onlyfans/public_html/resources/views/posts/edit-post.blade.php ENDPATH**/ ?>