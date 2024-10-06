<?php $__env->startSection('seo_title'); ?> TransBank - <?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="container mt-5">
<div class="row">
	<div class="col-12 col-sm-12 col-md-6 offset-0 offset-sm-0 offset-md-3">
		<div class="card shadow-sm">

			<div class="alert alert-secondary text-center">
			<h5>
				<?php echo app('translator')->get('v19.unlockInfo', ['amount'   => opt('payment-settings.currency_symbol') . number_format($lockPrice,2)]); ?>
			</h5>
			</div>

            <form method="post" action="<?php echo e($resp->getUrl()); ?>" name="transbank-form" id="transbank-form">
                <input type="hidden" name="token_ws" value=<?php echo e($resp->getToken()); ?> />
            </form>

			<div class="text-center mb-3">
				<img src="<?php echo e(asset('images/powered-by-transbank.jpg')); ?>" alt='TransBank' class="img-fluid col-6" id="imgPP"/>
			</div>

			</div>
		</div>
	</div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('extraJS'); ?>

<script>
window.onload = function(){
  document.forms['transbank-form'].submit();
}
$("#imgPP").click(function() {
	document.forms['transbank-form'].submit();
});
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('welcome', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /Users/crivion/Sites/patrons/resources/views/messages/transbank-unlock.blade.php ENDPATH**/ ?>